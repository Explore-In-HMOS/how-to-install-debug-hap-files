import { ChapterInfo } from '../model/GuideModels';

@Component
export struct ChapterCard {
  @Prop chapter: ChapterInfo = new ChapterInfo(0, '', '', 0, 0);
  @Prop completion: number = 0;
  onOpen: (id: number) => void = (): void => {
  };

  build() {
    Column({ space: 4 }) {
      Text(this.chapter.label)
        .fontSize(13)
        .fontWeight(FontWeight.Medium)
        .fontColor($r('app.color.chapter_title_color'))
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })

      Text(this.chapter.description)
        .fontSize(10)
        .fontColor($r('app.color.chapter_description_color'))
        .maxLines(3)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.Ellipsis })

      Text($r('app.string.chapter_completion', this.completion))
        .fontSize(10)
        .fontColor($r('app.color.chapter_completion_color'))
    }
    .width('100%')
    .padding({
      left: 11,
      right: 11,
      top: 12,
      bottom: 12
    })
    .backgroundColor($r('app.color.chapter_card_background'))
    .borderRadius(15)
    .onClick(() => {
      this.onOpen(this.chapter.id);
    })
  }
}