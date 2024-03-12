
import {ChatPage} from '../chat/chatPage';
import {FriendsPage} from '../friends/friendsPage';
import {FindPage} from '../find/findPage';
import {MinePage} from '../mine/minePage';


@Component
export struct MainPage {
  @State currentIndex: number = 0;
  private controller: TabsController = new TabsController()

  @Builder TabBuilder(title: string, targetIndex: number,selectedImage: Resource, normalImage: Resource){
    Column(){
      Image(this.currentIndex == targetIndex ? selectedImage : normalImage)
        .size({width: 25, height: 25})
      Text(title)
        .fontColor(this.currentIndex == targetIndex ? '#1698CE' : '#6B6B6B')
    }.width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)
    .onClick(() => {
      this.currentIndex = targetIndex;
      this.controller.changeIndex(this.currentIndex);
    })
  }

  build() {
    Tabs({barPosition: BarPosition.End, controller: this.controller}){
      TabContent() {
        ChatPage().width('100%').height('100%').backgroundColor('#00CB87')
      }
      .tabBar(this.TabBuilder('微信', 0, $r('app.media.chat_selected_image'), $r('app.media.chat_normal_image')))

      TabContent() {
        FriendsPage().width('100%').height('100%').backgroundColor('#007DFF')
      }
      .tabBar(this.TabBuilder('通讯录', 1, $r('app.media.friends_selected_image'), $r('app.media.friends_normal_image')))

      TabContent() {
        FindPage().width('100%').height('100%').backgroundColor('#007DFF')
      }
      .tabBar(this.TabBuilder('朋友圈', 2, $r('app.media.find_selected_image'), $r('app.media.find_normal_image')))

      TabContent() {
        MinePage().width('100%').height('100%').backgroundColor('#007DFF')
      }
      .tabBar(this.TabBuilder('我的', 3, $r('app.media.mine_selected_image'), $r('app.media.mine_normal_image')))
    }
    .barWidth('100%')
    .barHeight(50)
    .onChange((index: number) => {
      this.currentIndex = index;
    })
  }
}