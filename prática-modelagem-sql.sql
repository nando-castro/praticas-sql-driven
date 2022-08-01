CREATE TABLE "public.customers" (
	"id" serial NOT NULL,
	"name" varchar(50) NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL,
	CONSTRAINT "customers_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.products" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"price" integer NOT NULL,
	CONSTRAINT "products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.images" (
	"id" serial NOT NULL,
	"url" TEXT NOT NULL,
	"productId" integer NOT NULL,
	CONSTRAINT "images_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.clothes" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"size" varchar(3) NOT NULL,
	"categoryId" integer NOT NULL,
	"productId" integer NOT NULL,
	CONSTRAINT "clothes_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.category" (
	"id" serial NOT NULL,
	"name" varchar(20) NOT NULL,
	CONSTRAINT "category_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);


CREATE TYPE STATUS_T AS ENUM('created', 'pay', 'delivered','canceled');

CREATE TABLE "public.purchases" (
	"id" serial NOT NULL,
	"customerId" integer NOT NULL,
	"productId" integer NOT NULL,
	"amount" integer NOT NULL,
	"datePurchase" DATE NOT NULL,
    "statusPurchase" STATUS_T NOT NULL,
	CONSTRAINT "purchases_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.address" (
	"id" serial NOT NULL,
	"road" TEXT NOT NULL,
	"number" integer NOT NULL,
	"cityId" integer NOT NULL,
	"postalCode" varchar(8) NOT NULL,
	"customerId" integer NOT NULL,
	CONSTRAINT "address_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.cities" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	"stateId" integer NOT NULL,
	CONSTRAINT "cities_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.states" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	CONSTRAINT "states_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);





ALTER TABLE "images" ADD CONSTRAINT "images_fk0" FOREIGN KEY ("productId") REFERENCES "products"("id");

ALTER TABLE "clothes" ADD CONSTRAINT "clothes_fk0" FOREIGN KEY ("categoryId") REFERENCES "category"("id");
ALTER TABLE "clothes" ADD CONSTRAINT "clothes_fk1" FOREIGN KEY ("productId") REFERENCES "products"("id");


ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk0" FOREIGN KEY ("customerId") REFERENCES "customers"("id");
ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk1" FOREIGN KEY ("productId") REFERENCES "products"("id");

ALTER TABLE "address" ADD CONSTRAINT "address_fk0" FOREIGN KEY ("cityId") REFERENCES "cities"("id");
ALTER TABLE "address" ADD CONSTRAINT "address_fk1" FOREIGN KEY ("customerId") REFERENCES "customers"("id");

ALTER TABLE "cities" ADD CONSTRAINT "cities_fk0" FOREIGN KEY ("stateId") REFERENCES "states"("id");








