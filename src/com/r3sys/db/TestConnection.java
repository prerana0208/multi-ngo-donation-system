package com.r3sys.db;

public class TestConnection {
    public static void main(String[] args) {
        if (DbConnection.getConnection() != null) {
            System.out.println("Database Connected");
        } else {
            System.out.println("Connection Failed");
        }
    }
}
