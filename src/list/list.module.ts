import { Module } from '@nestjs/common';
import { ListController } from './list.controller';
import { ListService } from './list.service';
import { JwtModule } from '@nestjs/jwt';

@Module({
  controllers: [ListController],
  providers: [ListService, JwtModule]
})
export class ListModule {}
