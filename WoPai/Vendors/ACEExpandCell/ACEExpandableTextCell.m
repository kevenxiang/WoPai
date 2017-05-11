//  ACEExpandableTextCell.m
//
// Copyright (c) 2014 Stefano Acerbetti
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.


#import "ACEExpandableTextCell.h"

#define kPadding 5
#define leftSpace 10
#define topSpace 5

@interface ACEExpandableTextCell ()<UITextViewDelegate>{
    UILabel     *   _titleLab;
}
@property (nonatomic, strong) SZTextView *textView;
@end

#pragma mark -

@implementation ACEExpandableTextCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _titleLab =     ({
            UILabel * titleLab = [[UILabel alloc]init];
            titleLab.frame = CGRectMake(leftSpace,
                                        topSpace,
                                        90,
                                        34);
            titleLab;
        });

        [self.contentView addSubview:_titleLab];
        
        [self.contentView addSubview:self.textView];
        

    }
    return self;
}

- (SZTextView *)textView
{
    if (_textView == nil) {
        CGRect cellFrame = self.contentView.bounds;
        cellFrame.origin.y += kPadding;
        cellFrame.size.height -= kPadding;
        cellFrame.origin.x = CGRectGetMaxX(_titleLab.frame);
        cellFrame.size.width -= CGRectGetMaxX(_titleLab.frame);
        
        _textView = [[SZTextView alloc] initWithFrame:cellFrame];
        _textView.delegate = self;
        
        _textView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        _textView.backgroundColor = [UIColor clearColor];
        _textView.font = [UIFont systemFontOfSize:15.0f];
        
        _textView.scrollEnabled = NO;
        _textView.showsVerticalScrollIndicator = NO;
        _textView.showsHorizontalScrollIndicator = NO;
        // textView.contentInset = UIEdgeInsetsZero;
    }
    return _textView;
}

- (void)setText:(NSString *)text
{
    _text = text;
    
    // update the UI and the cell size with a delay to allow the cell to load
    self.textView.text = text;
    [self performSelector:@selector(textViewDidChange:)
               withObject:self.textView
               afterDelay:0.1];
    
    
//    _titleLab.center = CGPointMake(_titleLab.center.x, [self cellHeight]/2);

}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _titleLab.center = CGPointMake(_titleLab.center.x, [self cellHeight]/2);

}
- (void)setTitle:(NSString *)title
{
    _titleLab.text = title;
}
- (CGFloat)cellHeight
{
    return [self.textView sizeThatFits:CGSizeMake(self.textView.frame.size.width, FLT_MAX)].height + kPadding * 2;
}

- (void)updateTextViewHeight {
    [self textViewDidChange:self.textView];
}

#pragma mark - Text View Delegate

-(void)textViewDidEndEditing:(UITextView *)textView{
    if ([self.expandableTableView.delegate respondsToSelector:@selector(tableView:textViewDidEndEditing:)]) {
        [(id<ACEExpandableTableViewDelegate>)self.expandableTableView.delegate tableView:self.expandableTableView textViewDidEndEditing:self.textView];
    }
}

- (void)textViewDidChangeSelection:(UITextView *)textView {
    if ([self.expandableTableView.delegate respondsToSelector:@selector(tableView:textViewDidChangeSelection:)]) {
        [(id<ACEExpandableTableViewDelegate>)self.expandableTableView.delegate tableView:self.expandableTableView textViewDidChangeSelection:self.textView];
    }
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([self.expandableTableView.delegate respondsToSelector:@selector(tableView:textView:shouldChangeTextInRange:replacementText:)]) {
        id<ACEExpandableTableViewDelegate> delegate = (id<ACEExpandableTableViewDelegate>)self.expandableTableView.delegate;
        return [delegate tableView:self.expandableTableView
                          textView:textView
           shouldChangeTextInRange:range
                   replacementText:text];
    }
    return YES;
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    // make sure the cell is at the top
    [self.expandableTableView scrollToRowAtIndexPath:[self.expandableTableView indexPathForCell:self]
                                    atScrollPosition:UITableViewScrollPositionTop
                                            animated:YES];
    
    return YES;
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if ([self.expandableTableView.delegate respondsToSelector:@selector(textViewDidBeginEditing:)]) {
        [(id<ACEExpandableTableViewDelegate>)self.expandableTableView.delegate textViewDidBeginEditing:textView];
    }
}

- (void)textViewDidChange:(UITextView *)theTextView
{
    if ([self.expandableTableView.delegate conformsToProtocol:@protocol(ACEExpandableTableViewDelegate)]) {
        
        id<ACEExpandableTableViewDelegate> delegate = (id<ACEExpandableTableViewDelegate>)self.expandableTableView.delegate;
        NSIndexPath *indexPath = [self.expandableTableView indexPathForCell:self];
        
        // update the text
        _text = self.textView.text;
        
        [delegate tableView:self.expandableTableView
                updatedText:_text
                atIndexPath:indexPath];
        
        CGFloat newHeight = [self cellHeight];
        CGFloat oldHeight = [delegate tableView:self.expandableTableView heightForRowAtIndexPath:indexPath];
        if (fabs(newHeight - oldHeight) > 0.01) {
            
            // update the height
            if ([delegate respondsToSelector:@selector(tableView:updatedHeight:atIndexPath:)]) {
                [delegate tableView:self.expandableTableView
                      updatedHeight:newHeight
                        atIndexPath:indexPath];
                
                _titleLab.center = CGPointMake(_titleLab.center.x,newHeight/2);
                
            }
            
            // refresh the table without closing the keyboard
            [self.expandableTableView beginUpdates];
            [self.expandableTableView endUpdates];
        }
    }
}

//纯输入框样式
- (void)onlyTextFiledCellType {
    _textView.frame = CGRectMake(10, topSpace, self.bounds.size.width - 20, [self cellHeight]);
}

@end

#pragma mark -

@implementation UITableView (ACEExpandableTextCell)

- (ACEExpandableTextCell *)expandableTextCellWithId:(NSString *)cellId
{
    ACEExpandableTextCell *cell = [self dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[ACEExpandableTextCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.expandableTableView = self;
    }
    return cell;
}

@end

