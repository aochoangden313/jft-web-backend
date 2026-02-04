import { IsUUID, IsOptional } from 'class-validator';

/**
 * UC-02 DTO - Lưu đáp án tạm thời
 *
 * Validate dữ liệu khi Guest lưu đáp án trong quá trình làm bài
 * - questionId: bắt buộc, phải là UUID hợp lệ
 * - selectedOptionId: tùy chọn, có thể null nếu guest chưa chọn
 */
export class SaveAnswerDto {
  @IsUUID('4', { message: 'questionId must be a valid UUID' })
  questionId: string;

  @IsUUID('4', { message: 'selectedOptionId must be a valid UUID' })
  @IsOptional()
  selectedOptionId: string | null;
}
