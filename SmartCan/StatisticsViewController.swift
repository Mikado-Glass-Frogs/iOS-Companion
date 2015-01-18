//
//  StatisticsViewController.swift
//  SmartCan
//
//  Created by Colin King on 1/17/15.
//  Copyright (c) 2015 Colin King. All rights reserved.
//

import UIKit

class StatisticsViewController: TemplateDetailViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let dg = DataGrabber()
        let recycle_data = dg.getDataArrayAt("container.axlui.password.num_recycle")
        let trash_data = dg.getDataArrayAt("container.axlui.password.num_trash")
        let total_trash = dg.getDataAt("container.axlui.password.total_trash")
        let total_recycle = dg.getDataAt("container.axlui.password.total_recycle")
        
        println(total_trash)
        println(total_recycle)
        let tt: CGFloat = CGFloat((total_trash as NSString).floatValue)
        let tr: CGFloat = CGFloat((total_recycle as NSString).floatValue)
        
        
        
        let items = [PNPieChartDataItem(value: tt, color: UIColor.ht_citrusColor()!, description: "TRASH"), PNPieChartDataItem(value: tr, color:UIColor.ht_emeraldColor()!, description: "RECYCLING")]
        let pieChart = PNPieChart(frame: CGRectMake(40, 155, 240, 240), items: items)
//        PNPieChartDataItem(
        
        pieChart.strokeChart()
//        pieChart.descriptionTextColor = [UIColor.ht_citrusColor() whiteColor];
//        pieChart.descriptionTextFont  = [UIFont fontWithName:@"Avenir-Medium" size:14.0];
//        [pieChart strokeChart];
        
//        //For Line Chart
//        PNLineChart * lineChart = [[PNLineChart alloc] initWithFrame:CGRectMake(0, 135.0, SCREEN_WIDTH, 200.0)];
//        [lineChart setXLabels:@[@"SEP 1",@"SEP 2",@"SEP 3",@"SEP 4",@"SEP 5"]];
//        
//        // Line Chart No.1
//        NSArray * data01Array = @[@60.1, @160.1, @126.4, @262.2, @186.2];
//        PNLineChartData *data01 = [PNLineChartData new];
//        data01.color = PNFreshGreen;
//        data01.itemCount = lineChart.xLabels.count;
//        data01.getData = ^(NSUInteger index) {
//            CGFloat yValue = [data01Array[index] floatValue];
//            return [PNLineChartDataItem dataItemWithY:yValue];
//        };
//        // Line Chart No.2
//        NSArray * data02Array = @[@20.1, @180.1, @26.4, @202.2, @126.2];
//        PNLineChartData *data02 = [PNLineChartData new];
//        data02.color = PNTwitterColor;
//        data02.itemCount = lineChart.xLabels.count;
//        data02.getData = ^(NSUInteger index) {
//            CGFloat yValue = [data02Array[index] floatValue];
//            return [PNLineChartDataItem dataItemWithY:yValue];
//        };
//        
//        lineChart.chartData = @[data01, data02];
//        [lineChart strokeChart];
        
    }
}