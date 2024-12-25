CREATE TABLE "public.hub_product" (
	"product _hash_key" varchar(255) NOT NULL,
	"load_timestamp" serial NOT NULL,
	"record_source" serial(255) NOT NULL,
	"product_code" varchar(255) NOT NULL,
	CONSTRAINT "hub_product_pk" PRIMARY KEY ("product _hash_key")
) WITH (
  OIDS=FALSE
);


CREATE TABLE "public.hub_order" (
	"order_hash_key" varchar(255) NOT NULL,
	"load_timestamp" serial NOT NULL,
	"record_source" serial(255) NOT NULL,
	"order_number" varchar(255) NOT NULL,
	CONSTRAINT "hub_order_pk" PRIMARY KEY ("order_hash_key")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.link_line_item" (
	"line_item_hash_key" varchar(255) NOT NULL,
	"load_date" TIMESTAMP NOT NULL,
	"record_source" varchar(255) NOT NULL,
	"order_hash_key" varchar(255) NOT NULL,
	"product_hash_key" varchar(255) NOT NULL,
	CONSTRAINT "link_line_item_pk" PRIMARY KEY ("line_item_hash_key")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.sat_order" (
	"order_hash_key" varchar(255) NOT NULL,
	"load_timestamp" TIMESTAMP NOT NULL,
	"record_source" varchar(255) NOT NULL,
	"comment" varchar(255) NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.sat_product" (
	"product_hash_key" varchar(255) NOT NULL,
	"load_timestamp" TIMESTAMP NOT NULL,
	"record_source" varchar(255) NOT NULL,
	"comment" varchar(255) NOT NULL,
	"price" bigint NOT NULL,
	"image_url" varchar(255) NOT NULL
) WITH (
  OIDS=FALSE
);


ALTER TABLE "link_line_item" ADD CONSTRAINT "link_line_item_fk0" FOREIGN KEY ("order_hash_key") REFERENCES "hub_order"("order_hash_key");
ALTER TABLE "link_line_item" ADD CONSTRAINT "link_line_item_fk1" FOREIGN KEY ("product_hash_key") REFERENCES "hub_product"("product _hash_key");

ALTER TABLE "sat_order" ADD CONSTRAINT "sat_order_fk0" FOREIGN KEY ("order_hash_key") REFERENCES "hub_order"("order_hash_key");

ALTER TABLE "sat_product" ADD CONSTRAINT "sat_product_fk0" FOREIGN KEY ("product_hash_key") REFERENCES "hub_product"("product _hash_key");
