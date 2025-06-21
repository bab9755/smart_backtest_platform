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
        {"bootstrap.servers", "localhost:9092"},
        {"group.id", "ticker-consumer"},
    };
    Consumer consumer(config); //init kafka consumer
    consumer.subscribe({"market_data"}); //subscribe to topic
    pqxx::connection conn("dbname=postgres user=boubalkaly host=localhost port=5432");
    cout << "Listening to Kafa"<<endl;


    //start listening to messages
    while (true) {
        Message message = consumer.poll();

        if (!message) {
            cout << "no message received yet, still listening" << endl;
            continue;
        }
        if (message.get_error()) {
            
            continue;
        }
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
        } catch (const std::exception& e) {
            std::cerr << "Error: " << e.what() << std::endl;
        }


    }


    return 0;
}


