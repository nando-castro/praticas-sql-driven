CREATE DATABASE "DrivenBank";

CREATE TABLE "customers"(
	"id" SERIAL PRIMARY KEY,
	"fullName" TEXT NOT NULL,
	"cpf" VARCHAR(11) UNIQUE NOT NULL,
	"email" TEXT UNIQUE NOT NULL,
	"password" TEXT NOT NULL
);

CREATE TYPE PHONE_T AS ENUM('landline','mobile');

CREATE TABLE "customersPhones" (
	"id" SERIAL PRIMARY KEY,
	"customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
	"number" VARCHAR(11) NOT NULL,
	"type" PHONE_T NOT NULL
);

CREATE TABLE "states" (
	"id" SERIAL PRIMARY KEY,
	name TEXT NOT NULL
);

CREATE TABLE "cities" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL,
	"stateId" INTEGER NOT NULL REFERENCES "states"("id") 
);

CREATE TABLE "customersAddresses" (
	"id" SERIAL PRIMARY KEY,
	"customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
	"street" TEXT NOT NULL,
	"number" VARCHAR(11) NOT NULL,
	"complement" TEXT,
	"postalCode" VARCHAR(8) NOT NULL,
	"cityId" INTEGER NOT NULL REFERENCES "cities"("id")
);

CREATE TABLE "bankAccount" (
	"id" SERIAL PRIMARY KEY,
	"customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
	"accountNumber" INTEGER UNIQUE NOT NULL, 
	"agency" INTEGER NOT NULL,
	"openDate" TIMESTAMP NOT NULL DEFAULT NOW(),
	"closeDate" TIMESTAMP
);

CREATE TYPE TRANSATION_T AS ENUM('deposit','withdraw');

CREATE TABLE "transactions" (
	"id" SERIAL PRIMARY KEY,
	"bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"),
	"amount" INTEGER NOT NULL DEFAULT 0,
	"type" TRANSATION_T NOT NULL,
	"time" TIMESTAMP TIME NOT NULL DEFAULT NOW(),
	"description" TEXT,
	"cancelled" BOOLEAN NOT NULL DEFAULT FALSE
);
CREATE TABLE "creditCards" (
	"id" SERIAL PRIMARY KEY,
	"bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"),
	"name" TEXT NOT NULL,
	"number" INTEGER NOT NULL,
	"securityCode" TEXT NOT NULL,
	"expirationMonth" DATE NOT NULL,
	"expirationYear" DATE NOT NULL,
	"password" TEXT NOT NULL,
	"limit" INTEGER NOT NULL DEFAULT 0
);