class Slide {
  constructor(ele) {
    this.ele = ele; 
    this.fragments = this.ele.querySelectorAll('.fragment');
  }

  activate() {
    this.ele.classList.add('active');
  }

  deactivate() {
    this.ele.classList.remove('active');
  }

  hasNextFragment() {
    const hasNext = this.fragments.length > 0 
      && this.fragmentIndex !== undefined 
      && this.fragmentIndex < this.fragments.length - 1;

    const ret = hasNext || this.fragments.length > 0 && this.fragmentIndex === undefined;

    return ret;
  }

  hasPreviousFragment() {
    return this.fragments.length > 0 
      && this.fragmentIndex !== undefined 
      && this.fragmentIndex >= 0;
  }

  nextFragment() {
    if(this.fragments && this.fragmentIndex === undefined) {
      this.fragmentIndex = 0; 
      this.currentFragment = this.fragments[this.fragmentIndex];
      this.currentFragment.classList.add('active');
    } else {
      this.fragmentIndex += 1;
      this.currentFragment = this.fragments[this.fragmentIndex];
      this.currentFragment.classList.add('active');
    }
  }

  previousFragment() {
    this.currentFragment.classList.remove('active');
    if(this.fragmentIndex === 0) {
      this.fragmentIndex = undefined;
    } else {
      this.fragmentIndex -= 1;
      this.currentFragment = this.fragments[this.fragmentIndex];
      this.currentFragment.classList.add('active');
    }
  }
}




class SlideShow {
  constructor(container, tag) {
    const slideTag = tag || 'section';
    this.touchStartX = null;
    this.touchEndX = null;
    this.slides = Array.prototype.map.call(container.querySelectorAll(slideTag), function(ele) {
      return new Slide(ele);
    });
  }

  start() {
    if(this.slides) {
      window.addEventListener('keydown', this.handleKey.bind(this));
      window.addEventListener('hashchange', this.hashChange.bind(this));

      // handling swipe events based on: 
      // https://gist.github.com/SleepWalker/da5636b1abcbaff48c4d
      window.addEventListener('touchstart', evt => {
        this.touchStartX = evt.changedTouches[0].screenX;
      });
      window.addEventListener('touchend', evt => {
        this.touchEndX = evt.changedTouches[0].screenX;
        this.handleSwipe();
      });
      const slideNum = parseInt(window.location.hash.substr(1));
      const startSlide = isNaN(slideNum) ? 0 : slideNum;
      this.slide(startSlide); 
    } 
  }

  hashChange() {
    const slideNum = parseInt(window.location.hash.substr(1));
    if(!isNaN(slideNum)) {
      this.slide(slideNum);
    }
  }

  handleKey(evt) {
    if(evt.key === 'ArrowRight' || evt.keyCode === 39) {
      this.next();
    } else if (evt.key === 'ArrowLeft' || evt.keyCode === 37) {
      this.prev();
    }
  }

  handleSwipe() {
    if (this.touchStartX !== null && this.touchEndX !== null && this.touchStartX > this.touchEndX) {
      this.next();
    } else if (this.touchStartX !== null && this.touchEndX !== null && this.touchStartX < this.touchEndX) {
      this.prev();
    }
    this.touchStartX = null;
    this.touchEndX = null;
  }

  next() {
    if(this.activeIndex === undefined 
        && this.activeSlide === undefined 
        && this.slides.length > 0) {
      this.activeIndex = 0;
      window.location.hash = this.activeIndex;
    } else if(this.activeSlide.hasNextFragment()) { 
      this.activeSlide.nextFragment(); 
    } else if(this.activeIndex < this.slides.length - 1 && this.activeSlide) {
      window.location.hash = this.activeIndex + 1;
    }
  }

  prev() {
    if(this.activeSlide.hasPreviousFragment()) { 
      this.activeSlide.previousFragment();
    } else if(this.activeIndex > 0 && this.activeSlide) {
      window.location.hash = this.activeIndex - 1;
    }
  }

  slide(i) {
    if(i < this.slides.length && i >= 0) {
      if(this.activeSlide !== undefined) {
        this.activeSlide.deactivate();
      }
      this.activeIndex = i;
      this.activeSlide = this.slides[this.activeIndex];
      this.activeSlide.activate();
    }
  }
}
