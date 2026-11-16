@Component
export struct WatchHeader {
  @Prop title: ResourceStr = '';
  @Prop subtitle: ResourceStr = '';

  build() {
    Column({ space: 2 }) {
      Text(this.subtitle)
        .fontSize(10)
        .fontColor('#7ED8DB')
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })

      Text(this.title)
        .fontSize(15)
        .fontWeight(FontWeight.Bold)
        .fontColor('#FFFFFF')
        .maxLines(2)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
    }
    .alignItems(HorizontalAlign.Center)
    .width('100%')
  }
}