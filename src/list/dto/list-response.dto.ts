import { ApiProperty } from "@nestjs/swagger";

export class ListResponse {
    
  @ApiProperty()
  id?: string;

  @ApiProperty()
  name?: string;

  @ApiProperty()
  classId?: string;

  @ApiProperty()
  isOpen?: boolean;

  @ApiProperty()
  shareToken?: string;

  @ApiProperty()
  secret: any;

  @ApiProperty()
  codeWindow?: number;

  @ApiProperty()
  createdAt?: string;
}
