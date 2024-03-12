import {MainPage} from '../pages/main/mainPage';
@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  build() {
    MainPage()
    .height('100%')
  }
}