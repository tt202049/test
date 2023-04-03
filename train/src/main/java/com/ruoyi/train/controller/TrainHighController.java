package com.ruoyi.train.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.train.domain.TrainHigh;
import com.ruoyi.train.service.ITrainHighService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 高铁车辆管理Controller
 * 
 * @author YALO
 * @date 2023-03-27
 */
@RestController
@RequestMapping("/train/hightrain")
public class TrainHighController extends BaseController
{
    @Autowired
    private ITrainHighService trainHighService;

    /**
     * 查询高铁车辆管理列表
     */
    @PreAuthorize("@ss.hasPermi('train:hightrain:list')")
    @GetMapping("/list")
    public TableDataInfo list(TrainHigh trainHigh)
    {
        startPage();
        List<TrainHigh> list = trainHighService.selectTrainHighList(trainHigh);
        return getDataTable(list);
    }

    /**
     * 导出高铁车辆管理列表
     */
    @PreAuthorize("@ss.hasPermi('train:hightrain:export')")
    @Log(title = "高铁车辆管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, TrainHigh trainHigh)
    {
        List<TrainHigh> list = trainHighService.selectTrainHighList(trainHigh);
        ExcelUtil<TrainHigh> util = new ExcelUtil<TrainHigh>(TrainHigh.class);
        util.exportExcel(response, list, "高铁车辆管理数据");
    }

    /**
     * 获取高铁车辆管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('train:hightrain:query')")
    @GetMapping(value = "/{hightrainId}")
    public AjaxResult getInfo(@PathVariable("hightrainId") Long hightrainId)
    {
        return success(trainHighService.selectTrainHighByHightrainId(hightrainId));
    }

    /**
     * 新增高铁车辆管理
     */
    @PreAuthorize("@ss.hasPermi('train:hightrain:add')")
    @Log(title = "高铁车辆管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TrainHigh trainHigh)
    {
        return toAjax(trainHighService.insertTrainHigh(trainHigh));
    }

    /**
     * 修改高铁车辆管理
     */
    @PreAuthorize("@ss.hasPermi('train:hightrain:edit')")
    @Log(title = "高铁车辆管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TrainHigh trainHigh)
    {
        return toAjax(trainHighService.updateTrainHigh(trainHigh));
    }

    /**
     * 删除高铁车辆管理
     */
    @PreAuthorize("@ss.hasPermi('train:hightrain:remove')")
    @Log(title = "高铁车辆管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{hightrainIds}")
    public AjaxResult remove(@PathVariable Long[] hightrainIds)
    {
        return toAjax(trainHighService.deleteTrainHighByHightrainIds(hightrainIds));
    }
}
