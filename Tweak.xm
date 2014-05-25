@interface CAMFlipButton : UIButton
@end

@interface PLCameraView : UIView
-(CAMFlipButton *)_flipButton;
@end

%hook PLCameraView

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {

	if ([gestureRecognizer isKindOfClass:[UILongPressGestureRecognizer class]]) {
             
                [[self _flipButton] sendActionsForControlEvents:UIControlEventTouchUpInside];
		return TRUE;
	}

	return %orig;
}

%end
