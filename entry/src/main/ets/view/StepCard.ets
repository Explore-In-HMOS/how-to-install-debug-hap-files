import { GuideStep } from '../model/GuideModels';
import { CommandCard } from './CommandCard';

@Component
export struct StepCard {
  @Prop step: GuideStep =
    new GuideStep(0, 0, '', '', '', '', '', '');
  @Prop commandHint: string = '';

  build() {
    Column({ space: 9 }) {
      Text(this.step.title)
        .fontSize(15)
        .fontWeight(FontWeight.Bold)
        .fontColor($r('app.color.step_title_color'))
        .textAlign(TextAlign.Center)
        .maxLines(3)

      Text(this.step.summary)
        .fontSize(11)
        .fontColor($r('app.color.step_summary_color'))
        .textAlign(TextAlign.Center)

      Text(this.step.instruction)
        .fontSize(11)
        .fontColor($r('app.color.step_instruction_color'))
        .textAlign(TextAlign.Center)

      if (this.step.hasCommand()) {
        CommandCard({
          command: this.step.command,
          hint: this.commandHint
        })
      }

      Column({ space: 3 }) {
        Text($r('app.string.step_tip'))
          .fontSize(9)
          .fontColor($r('app.color.step_tip_title_color'))

        Text(this.step.note)
          .fontSize(10)
          .fontColor($r('app.color.step_tip_text_color'))
          .textAlign(TextAlign.Center)
      }
      .width('100%')
      .padding(9)
      .backgroundColor($r('app.color.step_tip_background'))
      .borderRadius(10)
    }
    .width('100%')
    .padding({ left: 4, right: 4 })
  }
}