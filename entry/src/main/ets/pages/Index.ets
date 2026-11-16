import { GuideViewModel } from '../viewmodel/GuideViewModel';
import { GuideStep, ChapterInfo } from '../model/GuideModels';
import { WatchHeader } from '../view/WatchHeader';
import { ChapterCard } from '../view/ChapterCard';
import { StepCard } from '../view/StepCard';

@Entry
@Component
struct Index {
  private vm: GuideViewModel = new GuideViewModel();
  @State onHome: boolean = true;
  @State completionText: string = '';
  @State chapterPercents: number[] = [0, 0, 0];
  @State chapterTitle: string = '';
  @State stepLabel: string = '';
  @State activeStep: GuideStep =
    new GuideStep(0, 0, '', '', '', '', '', '');
  @State commandHint: string = '';
  @State checked: boolean = false;

  aboutToAppear(): void {
    this.syncFromViewModel();
  }

  private syncFromViewModel(): void {
    this.onHome = this.vm.isHome();

    this.completionText = this.vm.completionLabel();

    this.chapterPercents = this.vm.allChapters().map(
      (chapter: ChapterInfo): number => {
        return this.vm.chapterProgress(chapter.id);
      }
    );

    this.chapterTitle = this.vm.chapterTag();
    this.stepLabel = this.vm.currentStepLabel();
    this.activeStep = this.vm.current();
    this.commandHint = this.vm.currentCommandHint();
    this.checked = this.vm.isCurrentChecked();
  }

  @Builder
  homeScreen() {
    Column({ space: 10 }) {
      WatchHeader({
        title: $r('app.string.guide_title'),
        subtitle: $r('app.string.guide_subtitle')
      })

      Text($r('app.string.guide_description'))
        .fontSize(11)
        .fontColor($r('app.color.guide_description_color'))
        .textAlign(TextAlign.Center)

      Text(this.completionText)
        .fontSize(10)
        .fontColor($r('app.color.completion_text_color'))

      ForEach(
        this.vm.allChapters(),
        (chapter: ChapterInfo) => {
          ChapterCard({
            chapter: chapter,
            completion: this.chapterPercents[chapter.id],
            onOpen: (id: number): void => {
              this.vm.openChapter(id);
              this.syncFromViewModel();
            }
          })
        },
        (chapter: ChapterInfo): string => chapter.id.toString()
      )

      Button($r('app.string.reset_checklist'))
        .fontSize(10)
        .height(30)
        .backgroundColor($r('app.color.reset_button_color'))
        .onClick(() => {
          this.vm.resetAll();
          this.syncFromViewModel();
        })

      Text($r('app.string.command_warning'))
        .fontSize(9)
        .fontColor($r('app.color.command_warning_color'))
        .textAlign(TextAlign.Center)
    }
    .width('100%')
  }

  @Builder
  stepScreen() {
    Column({ space: 9 }) {
      WatchHeader({
        title: this.chapterTitle,
        subtitle: this.stepLabel
      })

      StepCard({
        step: this.activeStep,
        commandHint: this.commandHint
      })

      Button(
        this.checked
          ? $r('app.string.completed')
          : $r('app.string.mark_completed')
      )
        .height(33)
        .fontSize(11)
        .backgroundColor(
          this.checked
            ? $r('app.color.completed_button_color')
            : $r('app.color.mark_completed_button_color')
        )
        .onClick(() => {
          this.vm.toggleCurrent();
          this.syncFromViewModel();
        })

      Row({ space: 5 }) {
        Button($r('app.string.back'))
          .layoutWeight(1)
          .height(31)
          .fontSize(11)
          .backgroundColor($r('app.color.back_button_color'))
          .onClick(() => {
            this.vm.previousInChapter();
            this.syncFromViewModel();
          })

        Button($r('app.string.next'))
          .layoutWeight(1)
          .height(31)
          .fontSize(11)
          .backgroundColor($r('app.color.next_button_color'))
          .onClick(() => {
            this.vm.nextInChapter();
            this.syncFromViewModel();
          })
      }
      .width('100%')

      Button($r('app.string.all_chapters'))
        .fontSize(10)
        .height(28)
        .backgroundColor($r('app.color.all_chapters_button_color'))
        .onClick(() => {
          this.vm.home();
          this.syncFromViewModel();
        })
    }
    .width('100%')
  }

  build() {
    Scroll() {
      Column({ space: 8 }) {
        if (this.onHome) {
          this.homeScreen()
        } else {
          this.stepScreen()
        }
      }
      .width('100%')
      .padding({
        left: 27,
        right: 27,
        top: 24,
        bottom: 28
      })
    }
    .scrollable(ScrollDirection.Vertical)
    .scrollBar(BarState.Off)
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.page_background_color'))
  }
}