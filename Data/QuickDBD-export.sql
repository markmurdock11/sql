-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "CardHolder" (
    "id" SERIAL   NOT NULL,
    "Name" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_CardHolder" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "CreditCard" (
    "card_number" INT   NOT NULL,
    "id_card_holder" INT   NOT NULL,
    CONSTRAINT "pk_CreditCard" PRIMARY KEY (
        "id_card_holder"
     )
);

CREATE TABLE "Merchant" (
    "id" SERIAL   NOT NULL,
    "name" VARCHAR(50)   NOT NULL,
    "id_merchant_cat" INT   NOT NULL,
    CONSTRAINT "pk_Merchant" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "MerchantCat" (
    "id" SERIAL   NOT NULL,
    "name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_MerchantCat" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Transaction" (
    "id" INT   NOT NULL,
    "date" TIMESTAMP   NOT NULL,
    "amount" FLOAT   NOT NULL,
    "card" INT   NOT NULL,
    "id_merchant" INT   NOT NULL,
    CONSTRAINT "pk_Transaction" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "CardHolder" ADD CONSTRAINT "fk_CardHolder_id" FOREIGN KEY("id")
REFERENCES "CreditCard" ("id_card_holder");

ALTER TABLE "Merchant" ADD CONSTRAINT "fk_Merchant_id" FOREIGN KEY("id")
REFERENCES "Transaction" ("id_merchant");

ALTER TABLE "Merchant" ADD CONSTRAINT "fk_Merchant_id_merchant_cat" FOREIGN KEY("id_merchant_cat")
REFERENCES "MerchantCat" ("id");

ALTER TABLE "Transaction" ADD CONSTRAINT "fk_Transaction_card" FOREIGN KEY("card")
REFERENCES "CreditCard" ("card_number");

ALTER TABLE "Transaction" ADD CONSTRAINT "fk_Transaction_id_merchant" FOREIGN KEY ("id_merchant")

