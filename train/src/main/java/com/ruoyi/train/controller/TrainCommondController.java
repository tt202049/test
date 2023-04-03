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
import com.ruoyi.train.domain.TrainCommond;
import com.ruoyi.train.service.ITrainCommondService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 调令管理Controller
 * 
 * @author YALO
 * @date 2023-03-31
 */
@RestController
@RequestMapping("/train/commondTrain")
public class TrainCommondController extends BaseController
{
    @Autowired
    private ITrainCommondService trainCommondService;

    /**
     * 查询调令管理列表
     */
    @PreAuthorize("@ss.hasPermi('train:commondTrain:list')")
    @GetMapping("/list")
    public TableDataInfo list(TrainCommond trainCommond)
    {
        startPage();
        List<TrainCommond> list = trainCommondService.selectTrainCommondList(trainCommond);
        return getDataTable(list);
    }

    /**
     * 导出调令管理列表
     */
    @PreAuthorize("@ss.hasPermi('train:commondTrain:export')")
    @Log(title = "调令管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, TrainCommond trainCommond)
    {
        List<TrainCommond> list = trainCommondService.selectTrainCommondList(trainCommond);
        ExcelUtil<TrainCommond> util = new ExcelUtil<TrainCommond>(TrainCommond.class);
        util.exportExcel(response, list, "调令管理数据");
    }

    /**
     * 获取调令管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('train:commondTrain:query')")
    @GetMapping(value = "/{commondId}")
    public AjaxResult getInfo(@PathVariable("commondId") Long commondId)
    {
        return success(trainCommondService.selectTrainCommondByCommondId(commondId));
    }

    /**
     * 新增调令管理
     */
    @PreAuthorize("@ss.hasPermi('train:commondTrain:add')")
    @Log(title = "调令管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TrainCommond trainCommond)
    {
        return toAjax(trainCommondService.insertTrainCommond(trainCommond));
    }

    /**
     * 修改调令管理
     */
    @PreAuthorize("@ss.hasPermi('train:commondTrain:edit')")
    @Log(title = "调令管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TrainCommond trainCommond)
    {
        return toAjax(trainCommondService.updateTrainCommond(trainCommond));
    }

    /**
     * 删除调令管理
     */
    @PreAuthorize("@ss.hasPermi('train:commondTrain:remove')")
    @Log(title = "调令管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{commondIds}")
    public AjaxResult remove(@PathVariable Long[] commondIds)
    {
        return toAjax(trainCommondService.deleteTrainCommondByCommondIds(commondIds));
    }
}
