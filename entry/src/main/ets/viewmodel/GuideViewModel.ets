import { ChapterInfo, GuideStep } from '../model/GuideModels';
import { GuideRepository } from '../services/GuideRepository';
import { GuideRules } from '../services/GuideRules';
import { GuideStorage } from '../services/GuideStorage';

export class GuideViewModel {
  private repository: GuideRepository = new GuideRepository();
  private storage: GuideStorage = new GuideStorage(this.repository.getStepCount());
  private currentStep: number = 0;
  private currentChapter: number = 0;
  private onHome: boolean = true;

  totalSteps(): number {
    return this.repository.getStepCount();
  }

  currentIndex(): number {
    return this.currentStep;
  }

  current(): GuideStep {
    return this.repository.getStep(this.currentStep);
  }

  currentChapterInfo(): ChapterInfo {
    return this.repository.getChapter(this.currentChapter);
  }

  chapter(id: number): ChapterInfo {
    return this.repository.getChapter(id);
  }

  isHome(): boolean {
    return this.onHome;
  }

  allChapters(): ChapterInfo[] {
    return this.repository.getChapters();
  }

  openChapter(id: number): void {
    if (!GuideRules.isValidChapter(id)) {
      return;
    }
    this.currentChapter = id;
    this.currentStep = this.repository.getChapter(id).firstStep;
    this.onHome = false;
  }

  openStep(index: number): void {
    if (index < 0 || index >= this.totalSteps()) {
      return;
    }
    this.currentStep = index;
    this.currentChapter = this.current().chapter;
    this.onHome = false;
  }

  home(): void {
    this.onHome = true;
  }

  next(): void {
    if (this.currentStep < this.totalSteps() - 1) {
      this.openStep(this.currentStep + 1);
    } else {
      this.home();
    }
  }

  previous(): void {
    if (this.currentStep > 0) {
      this.openStep(this.currentStep - 1);
    } else {
      this.home();
    }
  }

  nextInChapter(): void {
    let chapter = this.repository.getChapter(this.currentChapter);
    if (this.currentStep >= chapter.lastStep) {
      if (this.currentChapter < 2) {
        this.openChapter(this.currentChapter + 1);
      } else {
        this.home();
      }
      return;
    }
    this.next();
  }

  previousInChapter(): void {
    let chapter = this.repository.getChapter(this.currentChapter);
    if (this.currentStep <= chapter.firstStep) {
      this.home();
      return;
    }
    this.previous();
  }

  toggleCurrent(): void {
    let checked = this.storage.isChecked(this.currentStep);
    this.storage.write(this.currentStep, !checked);
  }

  isCurrentChecked(): boolean {
    return this.storage.isChecked(this.currentStep);
  }

  isChecked(index: number): boolean {
    return this.storage.isChecked(index);
  }

  completed(): number {
    return this.storage.count();
  }

  totalProgress(): number {
    return GuideRules.percentage(this.completed(), this.totalSteps());
  }

  chapterProgress(id: number): number {
    let chapter = this.repository.getChapter(id);
    return GuideRules.chapterPercent(
      this.storage.read(), chapter.firstStep, chapter.lastStep
    );
  }

  currentStepLabel(): string {
    return GuideRules.stepNumber(this.currentStep, this.totalSteps());
  }

  currentCommandHint(): string {
    return GuideRules.commandHint(this.current());
  }

  chapterTag(): string {
    return GuideRules.chapterLabel(this.currentChapter);
  }

  resetAll(): void {
    this.storage.reset();
    this.home();
  }

  chapterStepCount(id: number): number {
    let chapter = this.chapter(id);
    return chapter.lastStep - chapter.firstStep + 1;
  }

  completionLabel(): string {
    return GuideRules.formatCompletion(this.completed(), this.totalSteps());
  }
}