#include <iostream>
#include <string>
#include <vector>
#include <memory>
#include <csignal>
#include <cstdlib>
#include <thread>
#include <cppkafka/cppkafka.h>
#include <pqxx/pqxx>
#include <nlohmann/json.hpp>


using namespace std;
using namespace cppkafka;
using json = nlohmann::json;

int main() {

    Configuration config = {
        {"bootstrap.servers", "kafka:9092"},
        {"group.id", "ticker-consumer"},
        {"auto.offset.reset", "earliest"}
    };
    
    Consumer consumer(config); //init kafka consumer
    consumer.subscribe({"market_data"}); //subscribe to topic
    pqxx::connection conn("dbname=backtest_engine user=root password=password host=postgres port=5432");
    cout << "Listening to Kafa"<<endl;


    //start listening to messages
    while (true) {
        Message message = consumer.poll(std::chrono::milliseconds(500));
        if (message) {
            if (message.get_error()) {
                if (!message.is_eof()) {
                    cerr << "Error: " << message.get_error() << endl;
                }
            } else {
                string payload = message.get_payload();
                try {
                    json tick = json::parse(payload);
                    string symbol = tick["symbol"];
                    double price = tick["price"];
                    double volume = tick["volume"];
                    string timestamp = tick["timestamp"];
                    pqxx::work tx{conn};

                    //save tick into the database
                    tx.exec("INSERT INTO ticks (symbol, price, volume, timestamp) VALUES ($1, $2, $3, $4)",
                             pqxx::params{symbol, price, volume, timestamp});
                    tx.commit();
                    cout << "Received: " << symbol << endl;
                } catch (const std::exception& e) {
                    std::cerr << "Error: " << e.what() << std::endl;
                }
            }
        }
    }


    return 0;
}


