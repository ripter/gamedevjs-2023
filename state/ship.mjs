
/**
 * Ship State
*/
export class Ship {
  constructor() {
    this.description = 'The Celestial\'s mission is a 969-year journey to Alpha Centauri, reaching a top speed of 7 million kilometers per hour.';
    this.TOTAL_JOURNEY_TIME = 969; // Total journey time to Alpha Centauri in years
    this.TOTAL_JOURNEY_LIGHTYEARS = 4.37; // Distance to Alpha Centauri in light years
    this.currentYear = 275; // Years Since Launch
    this.currentLightYear = this.calculateDistanceToEarth(this.currentYear); // Light Years from Earth.
  }

  /**
   * 
   * @param {Object} time - Time since the ship launched.
   * @param {Number} time.year - Years since the ship launched.
   * @param {Number} time.month - Months in the current year since the ship launched.
   * @param {Number} time.day - Days in the current month since the ship launched.
   * @returns Distance to Earth in Light Years (aka the Speed of Light).
   */
  calculateDistanceToEarth(time) {
    const decimalYear = this.convertTimeToDecimalYear(time);

    let proportionOfJourneyComplete;

    // if less than halfway
    if (decimalYear < this.TOTAL_JOURNEY_TIME / 2) {
      // square the proportion of the journey complete (this accounts for the acceleration)
      proportionOfJourneyComplete = Math.pow(decimalYear / (this.TOTAL_JOURNEY_TIME / 2), 2);
    } else {
      // for the second half of the journey, we flip the calculation and then subtract from 1 (this accounts for the deceleration)
      proportionOfJourneyComplete = 1 - Math.pow((this.TOTAL_JOURNEY_TIME - decimalYear) / (this.TOTAL_JOURNEY_TIME / 2), 2);
    }

    return proportionOfJourneyComplete * this.TOTAL_JOURNEY_LIGHTYEARS;
  }

  /**
   * Converts a distance in Light Years to the number of years since the Ship launched.
   * @param {Number} distanceInLightYears - Number of Light Years between the Ship and Earth.
   * @returns The Ship year when Earth is at the distance.
   */
  calculateYearBasedOnDistance(distanceInLightYears) {
    let proportionOfJourneyComplete = distanceInLightYears / this.TOTAL_JOURNEY_LIGHTYEARS;

    let decimalYear;
    // if less than halfway
    if (distanceInLightYears <= this.TOTAL_JOURNEY_LIGHTYEARS / 2) {
      // square root the proportion of the journey complete (this accounts for the acceleration)
      decimalYear = Math.sqrt(proportionOfJourneyComplete) * (this.TOTAL_JOURNEY_TIME / 2);
    } else {
      // for the second half of the journey, we flip the calculation and then add to the half-way point (this accounts for the deceleration)
      decimalYear = this.TOTAL_JOURNEY_TIME / 2 + Math.sqrt(1 - proportionOfJourneyComplete) * (this.TOTAL_JOURNEY_TIME / 2);
    }

    const year = Math.floor(decimalYear);
    const remainderOfYear = decimalYear - year;

    const time = this.convertDecimalYearToTime(remainderOfYear);

    time.year += year;

    return time;
  }

  /**
   * Converts a Light Year into year, month, day.
   * @param {Number} decimalYear 
   * @returns 
   */
  convertDecimalYearToTime(decimalYear) {
    const year = Math.floor(decimalYear);
    const remaining = decimalYear - year;

    const monthsInYear = 12;
    const daysInMonth = 30.44;

    const decimalMonth = remaining * monthsInYear;
    const month = Math.floor(decimalMonth);
    const remainingMonth = decimalMonth - month;

    const day = Math.round(remainingMonth * daysInMonth);

    return {
      year: year,
      month: month,
      day: day
    };
  }

  /**
   * Converts a Year, Month, Day into a decimal year value.
   * @param {{year, month, day}} time 
   * @returns 
   */
  convertTimeToDecimalYear(time) {
    const monthsInYear = 12;
    const daysInMonth = 30.44;

    const year = time.year;
    const month = time.month / monthsInYear;
    const day = time.day / (daysInMonth * monthsInYear);

    const decimalYear = year + month + day;

    return decimalYear;
  }
}
