import { Module } from '@nestjs/common';
import { ClassController } from './class.controller';
import { ClassService } from './class.service';
import { JwtStrategy } from 'src/auth/jwt.strategy';

@Module({
  controllers: [ClassController],
  providers: [ClassService, JwtStrategy]
})
export class ClassModule {}
