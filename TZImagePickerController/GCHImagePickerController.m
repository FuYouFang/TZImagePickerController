//
//  GCHImagePickerController.m
//  TZImagePickerController
//
//  Created by fuyoufang on 2018/5/16.
//  Copyright © 2018 谭真. All rights reserved.
//

#import "GCHImagePickerController.h"
#import "UIView+Layout.h"
#import "UIColor+hexColor.h"

@interface GCHImagePickerController ()

@end

@implementation GCHImagePickerController


- (instancetype)initWithMaxImagesCount:(NSInteger)maxImagesCount columnNumber:(NSInteger)columnNumber delegate:(id<TZImagePickerControllerDelegate>)delegate pushPhotoPickerVc:(BOOL)pushPhotoPickerVc {
    
    self = [super initWithMaxImagesCount:maxImagesCount columnNumber:columnNumber delegate:delegate pushPhotoPickerVc:pushPhotoPickerVc];
    if (self) {
        self.isSelectOriginalPhoto = NO;
        
        
        self.allowTakePicture = YES; // 在内部显示拍照按钮
        self.allowTakeVideo = NO;   // 在内部显示拍视频按
        self.doneBtnTitleStr = @"完成";
        self.iconThemeColor = [UIColor hexColor:@"2396FF"];
        self.oKButtonTitleColorNormal = [UIColor whiteColor];
        self.oKButtonTitleColorDisabled = [UIColor whiteColor];
//        self.oKButtonBackgroundColorNormal = [UIColor hexColor:@"2396FF"];
        //self.oKButtonBackgroundColorDisabled = [[UIColor hexColor:@"2396FF"] colorWithAlphaComponent:0.5];
        // 147 203 253
//        self.oKButtonBackgroundColorDisabled = [UIColor colorWithRed:147 / 255.f green:203 / 255.f blue:253 / 255.f alpha:1];
        
        // 设置是否显示图片序号
        self.showSelectedIndex = YES;
        //        self.photoSelImage = [UIImage imageNamed:@""];
        //        self.photoDefImage = [UIImage imageNamed:@"image_xuanzhe_d"];
        
        
        
        // imagePickerVc.photoWidth = 1000;
        
        self.navigationBar.translucent = NO;
        
        self.iconThemeColor = [UIColor colorWithRed:31 / 255.0 green:185 / 255.0 blue:34 / 255.0 alpha:1.0];
        self.showPhotoCannotSelectLayer = YES;
        self.cannotSelectLayerColor = [[UIColor whiteColor] colorWithAlphaComponent:0.8];
        [self setPhotoPickerPageUIConfigBlock:^(UICollectionView *collectionView, UIView *bottomToolBar, UIButton *previewButton, UIButton *originalPhotoButton, UILabel *originalPhotoLabel, UIButton *doneButton, UIImageView *numberImageView, UILabel *numberLabel, UIView *divideLine) {
            [previewButton setTitleColor:[UIColor hexColor:@"2396FF"] forState:UIControlStateNormal];
            if (numberLabel.superview) {
                [numberLabel removeFromSuperview];
            }
            if (numberImageView.superview) {
                [numberImageView removeFromSuperview];
            }
        }];
        
        [self setPhotoPreviewPageUIConfigBlock:^(UICollectionView *collectionView, UIView *naviBar, UIButton *backButton, UIButton *selectButton, UILabel *indexLabel, UIView *toolBar, UIButton *originalPhotoButton, UILabel *originalPhotoLabel, UIButton *doneButton, UIImageView *numberImageView, UILabel *numberLabel) {
            [doneButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            if (numberLabel.superview) {
                [numberLabel removeFromSuperview];
            }
            if (numberImageView.superview) {
                [numberImageView removeFromSuperview];
            }
        }];
        
        // 3. Set allow picking video & photo & originalPhoto or not
        // 3. 设置是否可以选择视频/图片/原图
        self.allowPickingVideo = NO;
        self.allowPickingImage = YES;
        self.allowPickingOriginalPhoto = NO;
        self.allowPickingGif = NO;
        self.allowPickingMultipleVideo = NO; // 是否可以多选视频
        self.showPhotoCannotSelectLayer = YES;
        // 4. 照片排列按修改时间升序
        self.sortAscendingByModificationDate = NO;
        
        
        /// 5. Single selection mode, valid when maxImagesCount = 1
        /// 5. 单选模式,maxImagesCount为1时才生效
        self.showSelectBtn = NO;
        self.allowCrop = NO;
        self.needCircleCrop = NO;
        // 设置竖屏下的裁剪尺寸
        NSInteger left = 30;
        NSInteger widthHeight = self.view.tz_width - 2 * left;
        NSInteger top = (self.view.tz_height - widthHeight) / 2;
        self.cropRect = CGRectMake(left, top, widthHeight, widthHeight);
        // 设置横屏下的裁剪尺寸
        // imagePickerVc.cropRectLandscape = CGRectMake((self.view.tz_height - widthHeight) / 2, left, widthHeight, widthHeight);
        /*
         [imagePickerVc setCropViewSettingBlock:^(UIView *cropView) {
         cropView.layer.borderColor = [UIColor redColor].CGColor;
         cropView.layer.borderWidth = 2.0;
         }];*/
        
        //imagePickerVc.allowPreview = NO;
        
        
        self.preferredLanguage = @"zh-Hans";
        // Deprecated, Use statusBarStyle
        // imagePickerVc.isStatusBarDefault = NO;
        self.statusBarStyle = UIStatusBarStyleLightContent;
        
        
    }
    
    return self;
}


@end
