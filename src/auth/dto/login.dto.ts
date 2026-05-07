import { IsString } from "class-validator"

export class LoginDto {
  
  @IsString()
  registration_number!: string;

  @IsString()
  password!: string;
}