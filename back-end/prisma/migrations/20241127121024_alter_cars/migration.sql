-- DropForeignKey
ALTER TABLE "Car" DROP CONSTRAINT "Car_created_user_id_fkey";

-- DropForeignKey
ALTER TABLE "Car" DROP CONSTRAINT "Car_updated_user_id_fkey";

-- AlterTable
ALTER TABLE "Car" ALTER COLUMN "created_user_id" DROP NOT NULL,
ALTER COLUMN "updated_user_id" DROP NOT NULL;

-- CreateTable
CREATE TABLE "Seller" (
    "id" SERIAL NOT NULL,
    "fullname" TEXT NOT NULL,
    "birth_date" TIMESTAMP(3) NOT NULL,
    "ident_document" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "is_manager" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Seller_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Seller_ident_document_key" ON "Seller"("ident_document");

-- CreateIndex
CREATE UNIQUE INDEX "Seller_email_key" ON "Seller"("email");

-- AddForeignKey
ALTER TABLE "Car" ADD CONSTRAINT "Car_created_user_id_fkey" FOREIGN KEY ("created_user_id") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Car" ADD CONSTRAINT "Car_updated_user_id_fkey" FOREIGN KEY ("updated_user_id") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;
