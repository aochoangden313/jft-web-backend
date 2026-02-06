-- CreateEnum
CREATE TYPE "ExamAccessStatus" AS ENUM ('PENDING', 'APPROVED', 'REJECTED');

-- CreateTable
CREATE TABLE "ExamAccess" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "examId" TEXT NOT NULL,
    "status" "ExamAccessStatus" NOT NULL DEFAULT 'PENDING',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "ExamAccess_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "ExamAccess_userId_idx" ON "ExamAccess"("userId");

-- CreateIndex
CREATE INDEX "ExamAccess_examId_idx" ON "ExamAccess"("examId");

-- CreateIndex
CREATE INDEX "ExamAccess_status_idx" ON "ExamAccess"("status");

-- CreateIndex
CREATE UNIQUE INDEX "ExamAccess_userId_examId_key" ON "ExamAccess"("userId", "examId");

-- AddForeignKey
ALTER TABLE "ExamAccess" ADD CONSTRAINT "ExamAccess_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ExamAccess" ADD CONSTRAINT "ExamAccess_examId_fkey" FOREIGN KEY ("examId") REFERENCES "Exam"("id") ON DELETE CASCADE ON UPDATE CASCADE;
