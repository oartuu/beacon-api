import { IsString } from "class-validator"

export class RegisterDto {
  @IsString()
  name!: string;

  @IsString()
  registration_number!: string;

  @IsString()
  password!: string;
}