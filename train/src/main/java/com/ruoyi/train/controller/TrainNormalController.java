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
import com.ruoyi.train.domain.TrainNormal;
import com.ruoyi.train.service.ITrainNormalService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 普速车次管理Controller
 * 
 * @author YALO
 * @date 2023-03-22
 */
@RestController
@RequestMapping("/train/normalTrain")
public class TrainNormalController extends BaseController
{
    @Autowired
    private ITrainNormalService trainNormalService;

    /**
     * 查询普速车次管理列表
     */
    @PreAuthorize("@ss.hasPermi('train:normalTrain:list')")
    @GetMapping("/list")
    public TableDataInfo list(TrainNormal trainNormal)
    {
        startPage();
        List<TrainNormal> list = trainNormalService.selectTrainNormalList(trainNormal);
        return getDataTable(list);
    }

    @PreAuthorize("@ss.hasPermi('train:normalTrain:list')")
    @GetMapping("/allList")
    public TableDataInfo allList(TrainNormal trainNormal){
        return getDataTable(trainNormalService.selectTrainNormalList(trainNormal));
    }

    /**
     * 导出普速车次管理列表
     */
    @PreAuthorize("@ss.hasPermi('train:normalTrain:export')")
    @Log(title = "普速车次管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, TrainNormal trainNormal)
    {
        List<TrainNormal> list = trainNormalService.selectTrainNormalList(trainNormal);
        ExcelUtil<TrainNormal> util = new ExcelUtil<TrainNormal>(TrainNormal.class);
        util.exportExcel(response, list, "普速车次管理数据");
    }

    /**
     * 获取普速车次管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('train:normalTrain:query')")
    @GetMapping(value = "/{trainId}")
    public AjaxResult getInfo(@PathVariable("trainId") Long trainId)
    {
        return success(trainNormalService.selectTrainNormalByTrainId(trainId));
    }

    /**
     * 新增普速车次管理
     */
    @PreAuthorize("@ss.hasPermi('train:normalTrain:add')")
    @Log(title = "普速车次管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TrainNormal trainNormal)
    {
        return toAjax(trainNormalService.insertTrainNormal(trainNormal));
    }

    /**
     * 修改普速车次管理
     */
    @PreAuthorize("@ss.hasPermi('train:normalTrain:edit')")
    @Log(title = "普速车次管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TrainNormal trainNormal)
    {
        return toAjax(trainNormalService.updateTrainNormal(trainNormal));
    }

    /**
     * 删除普速车次管理
     */
    @PreAuthorize("@ss.hasPermi('train:normalTrain:remove')")
    @Log(title = "普速车次管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{trainIds}")
    public AjaxResult remove(@PathVariable Long[] trainIds)
    {
        return toAjax(trainNormalService.deleteTrainNormalByTrainIds(trainIds));
    }
}
