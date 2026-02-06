import { IsUUID } from 'class-validator';

export class ApproveExamAccessDto {
  @IsUUID('4')
  userId: string;
}
