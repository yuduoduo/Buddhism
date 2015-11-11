//
//  BDPlayViewController.m
//  Buddhism
//
//  Created by Vincent on 15/11/10.
//  Copyright © 2015年 Vincent. All rights reserved.
//

#import "BDPlayViewController.h"

@interface BDPlayViewController ()
@property (strong, nonatomic) AVAudioPlayer *audioPlayer; // This is used by playerControl1.
@property (strong, nonatomic) NSTimer *timer; // This is used by playerControl2.
@property (nonatomic) dispatch_source_t timerSource; // This is used by playerControl3.

@end

@implementation BDPlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Jimdubtrix_XTC-of-Gold-160" ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:path];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    self.audioPlayer.delegate = self;
    [self.audioPlayer prepareToPlay];
    self.playerControl.duration = self.audioPlayer.duration;
    self.playerControl.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)playButtonClicked:(id)sender {
    
    BOOL startsPlaying = !self.audioPlayer.playing;
    self.playerControl.playing = startsPlaying;
    if (startsPlaying) {
        [self.audioPlayer play];
    }
    else {
        [self.audioPlayer stop];
        self.audioPlayer.currentTime = 0.0;
        [self.audioPlayer prepareToPlay];
    }
}
#pragma mark - EECircularMusicPlayerControlDelegate
- (NSTimeInterval)currentTime
{
    return self.audioPlayer.currentTime;
}

#pragma mark - AVAudioPlayerDelegate
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    self.playerControl.playing = NO;
    [self.audioPlayer prepareToPlay];
}
@end
