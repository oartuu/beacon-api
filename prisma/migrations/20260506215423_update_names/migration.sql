/*
  Warnings:

  - You are about to drop the column `email` on the `Professor` table. All the data in the column will be lost.
  - You are about to drop the column `nome` on the `Professor` table. All the data in the column will be lost.
  - You are about to drop the column `senha` on the `Professor` table. All the data in the column will be lost.
  - You are about to drop the `Lista` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ListaItem` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Turma` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[registration_number]` on the table `Professor` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `name` to the `Professor` table without a default value. This is not possible if the table is not empty.
  - Added the required column `password` to the `Professor` table without a default value. This is not possible if the table is not empty.
  - Added the required column `registration_number` to the `Professor` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Lista" DROP CONSTRAINT "Lista_turmaId_fkey";

-- DropForeignKey
ALTER TABLE "ListaItem" DROP CONSTRAINT "ListaItem_listaId_fkey";

-- DropForeignKey
ALTER TABLE "Turma" DROP CONSTRAINT "Turma_professorId_fkey";

-- DropIndex
DROP INDEX "Professor_email_key";

-- AlterTable
ALTER TABLE "Professor" DROP COLUMN "email",
DROP COLUMN "nome",
DROP COLUMN "senha",
ADD COLUMN     "name" TEXT NOT NULL,
ADD COLUMN     "password" TEXT NOT NULL,
ADD COLUMN     "registration_number" TEXT NOT NULL;

-- DropTable
DROP TABLE "Lista";

-- DropTable
DROP TABLE "ListaItem";

-- DropTable
DROP TABLE "Turma";

-- CreateTable
CREATE TABLE "Class" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "professorId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Class_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "List" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "classId" TEXT NOT NULL,
    "isOpen" BOOLEAN NOT NULL DEFAULT true,
    "shareToken" TEXT NOT NULL,
    "secret" TEXT,
    "codeWindow" INTEGER NOT NULL DEFAULT 60,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "List_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ListItem" (
    "id" TEXT NOT NULL,
    "listId" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "registration_number" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ListItem_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "List_shareToken_key" ON "List"("shareToken");

-- CreateIndex
CREATE INDEX "ListItem_registration_number_idx" ON "ListItem"("registration_number");

-- CreateIndex
CREATE UNIQUE INDEX "ListItem_listId_registration_number_key" ON "ListItem"("listId", "registration_number");

-- CreateIndex
CREATE UNIQUE INDEX "Professor_registration_number_key" ON "Professor"("registration_number");

-- AddForeignKey
ALTER TABLE "Class" ADD CONSTRAINT "Class_professorId_fkey" FOREIGN KEY ("professorId") REFERENCES "Professor"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "List" ADD CONSTRAINT "List_classId_fkey" FOREIGN KEY ("classId") REFERENCES "Class"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ListItem" ADD CONSTRAINT "ListItem_listId_fkey" FOREIGN KEY ("listId") REFERENCES "List"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
