-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "CardHolder" (
    "id" SERIAL   NOT NULL,
    "name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_CardHolder" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "CreditCard" (
    "card" VARCHAR   NOT NULL,
    "idcardholder" INT   NOT NULL,
    CONSTRAINT "pk_CreditCard" PRIMARY KEY (
        "card"
     )
);

CREATE TABLE "Merchant" (
    "id" SERIAL   NOT NULL,
    "name" VARCHAR   NOT NULL,
    "id_merch_cat" INT   NOT NULL,
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
    "card" VARCHAR   NOT NULL,
    "id_merchant" INT   NOT NULL,
    CONSTRAINT "pk_Transaction" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "CreditCard" ADD CONSTRAINT "fk_CreditCard_idcardholder" FOREIGN KEY("idcardholder")
REFERENCES "CardHolder" ("id");

ALTER TABLE "Merchant" ADD CONSTRAINT "fk_Merchant_id_merch_cat" FOREIGN KEY("id_merch_cat")
REFERENCES "MerchantCat" ("id");

ALTER TABLE "Transaction" ADD CONSTRAINT "fk_Transaction_card" FOREIGN KEY("card")
REFERENCES "CreditCard" ("card");

ALTER TABLE "Transaction" ADD CONSTRAINT "fk_Transaction_id_merchant" FOREIGN KEY("id_merchant")
REFERENCES "Merchant" ("id");

