@Component
export struct CommandCard {
  @Prop command: string = '';
  @Prop hint: string = '';

  build() {
    Column({ space: 5 }) {
      Text($r('app.string.command_card_title'))
        .fontSize(9)
        .fontColor($r('app.color.command_card_title_color'))

      Text(this.command)
        .fontSize(10)
        .fontFamily('monospace')
        .fontColor($r('app.color.command_card_text_color'))
        .maxLines(5)
        .textAlign(TextAlign.Center)
        .wordBreak(WordBreak.BREAK_ALL)

      Text(this.hint)
        .fontSize(10)
        .fontColor($r('app.color.command_card_hint_color'))
        .maxLines(4)
        .textAlign(TextAlign.Center)
    }
    .width('100%')
    .padding(10)
    .borderRadius(12)
    .backgroundColor($r('app.color.command_card_background'))
  }
}