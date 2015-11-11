//
//  BDPlayViewController.h
//  Buddhism
//
//  Created by Vincent on 15/11/10.
//  Copyright © 2015年 Vincent. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "EECircularMusicPlayerControl.h"

@interface BDPlayViewController : UIViewController<EECircularMusicPlayerControlDelegate, AVAudioPlayerDelegate>
@property (weak, nonatomic) IBOutlet EECircularMusicPlayerControl *playerControl;

@end
