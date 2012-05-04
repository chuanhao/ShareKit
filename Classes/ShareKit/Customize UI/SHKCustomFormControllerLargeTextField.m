//
//  SHKCustomFormControllerLargeTextField.m
//  ShareKit
//
//  Created by Nathan Weiner on 6/28/10.

//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//
//

#import "SHKCustomFormControllerLargeTextField.h"
#import <QuartzCore/QuartzCore.h>

@implementation SHKCustomFormControllerLargeTextField

// See http://getsharekit.com/customize/ for additional information on customizing

- (void)loadView {
    
    [super loadView];
    
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.view.frame) - 10.0 - 63.0, 0.0 + 3.0, 63.0, 42.0)];
    if (self.image) {
        imageView.image = self.image;
    }
    imageView.clipsToBounds = YES;
    CALayer *layer = imageView.layer;
    layer.borderWidth = 1.0;
    layer.borderColor = [UIColor grayColor].CGColor;
    layer.cornerRadius = 5.0;
    [self.view addSubview:imageView];    
    _imageView = [imageView retain];
    [imageView release];
}

- (void)viewDidLayoutSubviews {
    
    [super viewDidLayoutSubviews];
    _imageView.frame = CGRectMake(CGRectGetMaxX(self.view.frame) - 10.0 - 63.0, 0.0 + 5.0, 63.0, 42.0);
}

- (void)setImage:(UIImage *)image {
    
    [super setImage:image];
    _imageView.image = image;
}

- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];	
	
    self.textView.selectedRange = NSMakeRange(0, 0);
}

- (void)dealloc {
    RELEASE_SAFELY(_imageView);
    [super dealloc];
}

@end
