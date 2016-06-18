//
//  ViewController.m
//  printfZigZag
//
//  Created by Bui Duc Khanh on 6/18/16.
//  Copyright © 2016 Bui Duc Khanh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtNumber;
@property (weak, nonatomic) IBOutlet UITextField *txtLenght;
@property (weak, nonatomic) IBOutlet UISwitch *iSwitchDownFirst;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onBtnPrintClick:(id)sender {
    int number = [_txtNumber.text intValue];
    int length = [_txtLenght.text intValue];
    bool isDownFirst = _iSwitchDownFirst.on;
    
    // Cách vẽ: hình zizag thực chất là ghép bởi các khối hình vuông dấu cách có đường chéo là các dấu * theo chiều "\" hoăc "/"
    // Viết 2 hàm vẽ các cạnh tương ứng cho khối hình vuông với chiều dấu * tương ứng
    for (int i = 0; i < length; i++)
    {
        for(int j = 0; j < number; j++)
        {
            if ((isDownFirst && ((j%2) == 0)) || (!isDownFirst && ((j%2) == 1)))
            {
                printDown(i, length, j, number);
            }
            else
            {
                printUp(i, length, j, number);
            }
        }
        
        printf("\n");
    }
    
    NSLog(@"Done");
}



// Hàm in cạnh của hình chữ nhật với chiều dấu * là "\"
void printDown (int posOfLength, int length, int posOfNumber, int number)
{
    // In số dấu cách bên trái
    for (int i = 0; i < posOfLength; i++)
        printf(" ");
    
    // In dấu * khi không phải là vị trí cuối (ưu tiên cho điểm cuối của print up) hoặc nếu là cạnh cuối cùng
    if ((posOfLength < (length - 1)) || posOfNumber == (number-1))
        printf("*");
    
    // In số dấu cách bên phải
    for (int i = 0; i < (length - 1 - posOfLength); i++)
        printf(" ");
    
    // Nếu không phải là lần in đầu sát lề console trái (posOfNumber > 0), in bù 1 dấu cách ở vị trí = 0 (posOfLength = 0) để bù khoảng cách
    if (posOfLength == 0 && posOfNumber > 0)
        printf(" ");
    
}


// Hàm in cạnh của hình chữ nhật với chiều dấu * là "/"
void printUp (int posOfLength, int length, int posOfNumber, int number)
{
    // In số dấu cách bên trái
    for (int i = 0; i < (length - 1 - posOfLength); i++)
        printf(" ");
    
    // In dấu * khi không phải là vị trí đầu (ưu tiên cho điểm đầu của print down) hoặc nếu là cạnh cuối cùng
    if ((posOfLength > 0) || posOfNumber == (number-1))
        printf("*");
    
    // In số dấu cách bên phải
    for (int i = 0; i < posOfLength; i++)
        printf(" ");

    // Nếu không phải là lần in đầu sát lề console trái (posOfNumber > 0), in bù 1 dấu cách ở vị trí được ưu tiên = (length - 1) (posOfLength == (length - 1)) để bù khoảng cách
    if (posOfLength == (length - 1) && posOfNumber > 0)
        printf(" ");

}

@end
