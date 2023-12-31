package com.ruoyi.train.service.impl;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.train.mapper.TrainCommondMapper;
import com.ruoyi.train.domain.TrainCommond;
import com.ruoyi.train.service.ITrainCommondService;
import org.springframework.web.multipart.MultipartFile;


/**
 * 调令管理Service业务层处理
 * 
 * @author YALO
 * @date 2023-03-31
 */
@Service
public class TrainCommondServiceImpl implements ITrainCommondService 
{
    @Autowired
    private TrainCommondMapper trainCommondMapper;

    /**
     * 查询调令管理
     * 
     * @param commondId 调令管理主键
     * @return 调令管理
     */
    @Override
    public TrainCommond selectTrainCommondByCommondId(Long commondId)
    {
        return trainCommondMapper.selectTrainCommondByCommondId(commondId);
    }

    /**
     * 查询调令管理列表
     * 
     * @param trainCommond 调令管理
     * @return 调令管理
     */
    @Override
    public List<TrainCommond> selectTrainCommondList(TrainCommond trainCommond)
    {
        return trainCommondMapper.selectTrainCommondList(trainCommond);
    }

    /**
     * 新增调令管理
     * 
     * @param trainCommond 调令管理
     * @return 结果
     */
    @Override
    public int insertTrainCommond(TrainCommond trainCommond)
    {
        return trainCommondMapper.insertTrainCommond(trainCommond);
    }

    /**
     * 修改调令管理
     * 
     * @param trainCommond 调令管理
     * @return 结果
     */
    @Override
    public int updateTrainCommond(TrainCommond trainCommond)
    {
        return trainCommondMapper.updateTrainCommond(trainCommond);
    }

    /**
     * 批量删除调令管理
     * 
     * @param commondIds 需要删除的调令管理主键
     * @return 结果
     */
    @Override
    public int deleteTrainCommondByCommondIds(Long[] commondIds)
    {
        return trainCommondMapper.deleteTrainCommondByCommondIds(commondIds);
    }

    /**
     * 删除调令管理信息
     * 
     * @param commondId 调令管理主键
     * @return 结果
     */
    @Override
    public int deleteTrainCommondByCommondId(Long commondId)
    {
        return trainCommondMapper.deleteTrainCommondByCommondId(commondId);
    }

    /**
     * 查询当日生效调令
     * @return
     */
    @Override
    public List<TrainCommond> selectCommondByDay(Date inputDate){
        return trainCommondMapper.selectCommondByDay(inputDate);
    }

    /**
     * 对word进行解析
     *
     */
    public List<TrainCommond> wordToCommond(MultipartFile file){
        try {
            // 读取文档
            FileInputStream in = (FileInputStream) file.getInputStream();
            // 读取word文档信息
            XWPFDocument xwpf = new XWPFDocument(in);
            for (XWPFParagraph para : xwpf.getParagraphs()){
                System.out.println(para.getText());

            }
            return null;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }
}
