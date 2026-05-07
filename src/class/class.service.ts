import { Injectable } from '@nestjs/common';
import { CreateClassDto } from './dto/createClass.dto';
import { PrismaService } from 'src/prisma/prisma.service';
@Injectable()
export class ClassService {
  constructor(private prisma: PrismaService) {}

  async create_class(dto: CreateClassDto, professorId: string) {
    const data = await this.prisma.class.create({
      data: {
        name: dto.name,
        professorId: professorId,
      },
    });

    return data;
  }

  async list_classes(professorId:string){
    return this.prisma.class.findMany({where:{professorId:professorId}})
  }

}
