import { Body, Controller, Get, Post, Req, Res } from '@nestjs/common';
import { UseGuards } from '@nestjs/common'

import { AuthGuard } from '@nestjs/passport'
import { CreateClassDto } from './dto/createClass.dto';
import type { RequestWithUser } from './types/request-with-user';
import { ClassService } from './class.service';


@Controller('class')
export class ClassController {
  constructor(private classService: ClassService) {}

  @UseGuards(AuthGuard('jwt'))
  @Post('create')
  async createClass(
    @Body() dto: CreateClassDto,
    @Res({ passthrough: true }) res: Response,
    @Req() req: RequestWithUser,
  ) {
    return this.classService.create_class(dto, req.user.id);
  }

  @UseGuards(AuthGuard('jwt'))
  @Get()
  async listClasses(
    @Res({ passthrough: true }) res: Response,
    @Req() req: RequestWithUser,
  ) {
    return this.classService.list_classes( req.user.id);
  }
}
