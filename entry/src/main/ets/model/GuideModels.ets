export class GuideStep {
  id: number;
  chapter: number;
  chapterName: string;
  title: string;
  summary: string;
  instruction: string;
  command: string;
  note: string;

  constructor(
    id: number,
    chapter: number,
    chapterName: string,
    title: string,
    summary: string,
    instruction: string,
    command: string,
    note: string
  ) {
    this.id = id;
    this.chapter = chapter;
    this.chapterName = chapterName;
    this.title = title;
    this.summary = summary;
    this.instruction = instruction;
    this.command = command;
    this.note = note;
  }

  hasCommand(): boolean {
    return this.command.length > 0;
  }
}

export class ChapterInfo {
  id: number;
  label: string;
  description: string;
  firstStep: number;
  lastStep: number;

  constructor(id: number, label: string, description: string,
    firstStep: number, lastStep: number) {
    this.id = id;
    this.label = label;
    this.description = description;
    this.firstStep = firstStep;
    this.lastStep = lastStep;
  }
}

export class GuideProgress {
  chapterId: number = 0;
  stepId: number = 0;
  marked: boolean[] = [];
  completed: number = 0;

  constructor(total: number) {
    for (let i = 0; i < total; i++) {
      this.marked.push(false);
    }
  }
}