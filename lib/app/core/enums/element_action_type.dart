enum ElementActionType {
  dateTime,
  bestShot,
  celebrityPix,
  brandPresence,
  location,
  checkHappy,
  closeEvent,
  cleanUp,
  teamCreator,
  friendFinder,
  sameAs,
  unknown,
}

extension ElementActionTypeExt on ElementActionType {
  static ElementActionType fromCode(String code) {
    switch (code) {
      case 'DATE_TIME':
        return ElementActionType.dateTime;
      case 'BEST_SHOT':
        return ElementActionType.bestShot;
      case 'CELEBRITY_PIX':
        return ElementActionType.celebrityPix;
      case 'BRAND_PRESENCE':
        return ElementActionType.brandPresence;
      case 'LOCATION':
        return ElementActionType.location;
      case 'CHECK_HAPPINESS':
        return ElementActionType.checkHappy;
      case 'CLOSE_EVENT':
        return ElementActionType.closeEvent;
      case 'CLEAN_UP':
        return ElementActionType.cleanUp;
      case 'TEAM_CREATOR':
        return ElementActionType.teamCreator;
      case 'FRIEND_FINDER':
        return ElementActionType.friendFinder;
      case 'SAME_AS':
        return ElementActionType.sameAs;
      default:
        return ElementActionType.unknown;
    }
  }
}
