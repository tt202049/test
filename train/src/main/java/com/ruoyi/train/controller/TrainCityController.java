package com.ruoyi.train.controller;

import java.lang.reflect.Array;
import java.util.List;
import javax.servlet.http.HttpServletResponse;


import ch.qos.logback.core.pattern.ConverterUtil;
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
import com.ruoyi.train.domain.TrainCity;
import com.ruoyi.train.service.ITrainCityService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 城际列车管理Controller
 * 
 * @author YALO
 * @date 2023-03-27
 */
@RestController
@RequestMapping("/train/cityTrain")
public class TrainCityController extends BaseController
{
    @Autowired
    private ITrainCityService trainCityService;

    /**
     * 查询城际列车管理列表
     */
    @PreAuthorize("@ss.hasPermi('train:cityTrain:list')")
    @GetMapping("/list")
    public TableDataInfo list(TrainCity trainCity)
    {
        startPage();
        List<TrainCity> list = trainCityService.selectTrainCityList(trainCity);
        return getDataTable(list);
    }

    /**
     * 导出城际列车管理列表
     */
    @PreAuthorize("@ss.hasPermi('train:cityTrain:export')")
    @Log(title = "城际列车管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, TrainCity trainCity)
    {
        List<TrainCity> list = trainCityService.selectTrainCityList(trainCity);
        ExcelUtil<TrainCity> util = new ExcelUtil<TrainCity>(TrainCity.class);
        util.exportExcel(response, list, "城际列车管理数据");
    }

    /**
     * 获取城际列车管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('train:cityTrain:query')")
    @GetMapping(value = "/{citytrainId}")
    public AjaxResult getInfo(@PathVariable("citytrainId") Long citytrainId)
    {
        return success(trainCityService.selectTrainCityByCitytrainId(citytrainId));
    }

    /**
     * 新增城际列车管理
     */
    @PreAuthorize("@ss.hasPermi('train:cityTrain:add')")
    @Log(title = "城际列车管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TrainCity trainCity)
    {
        return toAjax(trainCityService.insertTrainCity(trainCity));
    }

    /**
     * 修改城际列车管理
     */
    @PreAuthorize("@ss.hasPermi('train:cityTrain:edit')")
    @Log(title = "城际列车管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TrainCity trainCity)
    {
        return toAjax(trainCityService.updateTrainCity(trainCity));
    }

    /**
     * 根据ID修改城际列车交路
     * args参数样例{"id":3,"trains":[1,3]}
     */
//    @PreAuthorize("@ss.hasPermi('train:cityTrain:edit')")
//    @Log(title = "城际列车管理", businessType = BusinessType.UPDATE)
    @PostMapping("/editWithId")
    public AjaxResult editWithTrainId(@RequestBody String args) throws Exception{
//        System.out.println(args);
        String groupId = args.split(",")[0].split(":")[1];
        String[] temp = (args.substring(args.indexOf("[")+1,args.indexOf("]"))).split(",");
        int[] trainId = new int[temp.length];
        for (int i = 0; i < temp.length; i++) {
            trainId[i] = Integer.parseInt(temp[i]);
        }
        return toAjax(trainCityService.updateTrainCityGroupById(trainId, Integer.parseInt(groupId)));
    }

    /**
     * 删除城际列车管理
     */
    @PreAuthorize("@ss.hasPermi('train:cityTrain:remove')")
    @Log(title = "城际列车管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{citytrainIds}")
    public AjaxResult remove(@PathVariable Long[] citytrainIds)
    {
        return toAjax(trainCityService.deleteTrainCityByCitytrainIds(citytrainIds));
    }
}
