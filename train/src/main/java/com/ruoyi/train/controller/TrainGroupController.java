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
import com.ruoyi.train.domain.TrainGroup;
import com.ruoyi.train.service.ITrainGroupService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 交路管理Controller
 * 
 * @author YALO
 * @date 2023-03-27
 */
@RestController
@RequestMapping("/train/trainGroup")
public class TrainGroupController extends BaseController
{
    @Autowired
    private ITrainGroupService trainGroupService;

    /**
     * 查询交路管理列表
     */
    @PreAuthorize("@ss.hasPermi('train:trainGroup:list')")
    @GetMapping("/list")
    public TableDataInfo list(TrainGroup trainGroup)
    {
        startPage();
        List<TrainGroup> list = trainGroupService.selectTrainGroupList(trainGroup);
        return getDataTable(list);
    }

    /**
     * 导出交路管理列表
     */
    @PreAuthorize("@ss.hasPermi('train:trainGroup:export')")
    @Log(title = "交路管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, TrainGroup trainGroup)
    {
        List<TrainGroup> list = trainGroupService.selectTrainGroupList(trainGroup);
        ExcelUtil<TrainGroup> util = new ExcelUtil<TrainGroup>(TrainGroup.class);
        util.exportExcel(response, list, "交路管理数据");
    }

    /**
     * 获取交路管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('train:trainGroup:query')")
    @GetMapping(value = "/{groupId}")
    public AjaxResult getInfo(@PathVariable("groupId") Long groupId)
    {
        return success(trainGroupService.selectTrainGroupByGroupId(groupId));
    }

    /**
     * 新增交路管理
     */
    @PreAuthorize("@ss.hasPermi('train:trainGroup:add')")
    @Log(title = "交路管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TrainGroup trainGroup)
    {
        return toAjax(trainGroupService.insertTrainGroup(trainGroup));
    }

    /**
     * 修改交路管理
     */
    @PreAuthorize("@ss.hasPermi('train:trainGroup:edit')")
    @Log(title = "交路管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TrainGroup trainGroup)
    {
//        for (String s :
//                trainGroup.getReciveusedTrain()) {
//            System.out.println(s);
//        }
        return toAjax(trainGroupService.updateTrainGroup(trainGroup));
    }

    /**
     * 删除交路管理
     */
    @PreAuthorize("@ss.hasPermi('train:trainGroup:remove')")
    @Log(title = "交路管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{groupIds}")
    public AjaxResult remove(@PathVariable Long[] groupIds)
    {
        return toAjax(trainGroupService.deleteTrainGroupByGroupIds(groupIds));
    }
}
