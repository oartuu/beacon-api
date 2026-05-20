-- CreateEnum
CREATE TYPE "PresenceOrigin" AS ENUM ('QR_CODE', 'SHARED_LINK');

-- AlterTable
ALTER TABLE "ListItem" ADD COLUMN     "origin" "PresenceOrigin" NOT NULL DEFAULT 'QR_CODE',
ADD COLUMN     "validationToken" TEXT;

-- CreateIndex
CREATE INDEX "ListItem_validationToken_idx" ON "ListItem"("validationToken");
