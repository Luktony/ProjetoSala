import { NestFactory } from '@nestjs/core'
import { AppModule } from './app.modules'
async function bootstrap() {
  const app = await NestFactory.create(AppModule);
    const port = 3377
  await app.listen(port);
  console.log(`🚀 HTTP Server Running! - Port: ${port}`)
}
bootstrap();
