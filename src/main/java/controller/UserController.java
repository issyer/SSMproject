package controller;


import dao.LoginCheck;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import pojo.*;
import service.UserService;

import javax.validation.Valid;
import java.util.List;

@Controller
@Component
public class UserController {


    @Autowired
    private UserService userService = null;
    @Autowired
    private LoginCheck loginCheck = null;
    private StaffWork staffWork ;
    private List<DeskChange> deskChange2;
    private List<DeskChange> deskChange3;
    private List<Resign> resigns;
    private List<Resign> resigns2;
    private List<Appeal> appeals;
    private List<Appeal> appeals2;
    private List<Notice> notice;

    String flag = "showtitle";
    private StaffPersonal staffPersonal = new StaffPersonal();

    @RequestMapping("/login")
    public ModelAndView login(@RequestParam("email") String email,@RequestParam("password") String password){
        ModelAndView modelAndView = new ModelAndView();
        if(loginCheck.loginForRegist(email,password)){
                staffPersonal.setIdcardNum(email);
                modelAndView.setViewName("register");
        }else if(loginCheck.loginForMain(email,password)){
            flag = "showtitle";
            modelAndView.setViewName("main");
            staffWork = userService.getUser(email);
            deskChange2 = userService.getDeskChangeList(staffWork.getWorkId());
            deskChange3 = userService.getDeskChangeList2(staffWork.getWorkId());
            resigns = userService.getResignList(staffWork.getWorkId());
            resigns2 = userService.getResignList2(staffWork.getWorkId());
            appeals2 = userService.getAppealList2(staffWork.getWorkId());
            appeals = userService.getAppealList(staffWork.getWorkId());
            notice = userService.getNoticeList();
            modelAndView.addObject("flag",flag);
            modelAndView.addObject("noticelist",notice);
            modelAndView.addObject("appealList",appeals);
            modelAndView.addObject("appealList2",appeals2);
            modelAndView.addObject("resignlist",resigns);
            modelAndView.addObject("resignlist2",resigns2);
            modelAndView.addObject("deskChangelist2",deskChange3);
            modelAndView.addObject("deskChangelist",deskChange2);
            modelAndView.addObject("staffwork",staffWork);
        }
        return modelAndView;
    }
    @RequestMapping("/regist")
    public ModelAndView regist(@Valid StaffPersonal staffPersonal2){
        int resultCode = 0 ;
        staffPersonal2.setIdcardNum(staffPersonal.getIdcardNum());
        ModelAndView modelAndView = new ModelAndView();
        resultCode = userService.registUser(staffPersonal2);
        if(resultCode!=0){
            modelAndView.setViewName("main");
        }else {
            modelAndView.setViewName("register");
        }
        return modelAndView;
    }

    @RequestMapping("/deskchange")
    public ModelAndView changeWorkDesk(@Valid DeskChange deskChange){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("staffwork",staffWork);
        deskChange.setWorkId(staffWork.getWorkId());
        int resultCode = 0 ;
        resultCode = userService.deskChangeApply(deskChange);
        deskChange2 = userService.getDeskChangeList(staffWork.getWorkId());
        modelAndView.addObject("deskChangelist",deskChange2);
        if(resultCode!=0){
            modelAndView.setViewName("main");
        }else {
            modelAndView.setViewName("main");
        }
        return modelAndView;
    }


    @RequestMapping("/resign")
    public ModelAndView resign(@Valid Resign resig){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("staffwork",staffWork);
        resig.setWorkId(staffWork.getWorkId());
        resig.setName(staffWork.getName());
        int resultCode = 0 ;
        resultCode = userService.resignApply(resig);
        resigns = userService.getResignList(staffWork.getWorkId());
        modelAndView.addObject("resignlist",resigns);
        if(resultCode!=0){
            modelAndView.setViewName("main");
        }else {
            modelAndView.setViewName("main");
        }
        return modelAndView;
    }

    @RequestMapping("/appeal")
    public ModelAndView appeal(@Valid Appeal appeal){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("staffwork",staffWork);
        appeal.setWorkId(staffWork.getWorkId());
        appeal.setName(staffWork.getName());
        int resultCode = 0 ;
        resultCode = userService.attendanceAppeal(appeal);
        appeals = userService.getAppealList(staffWork.getWorkId());
        modelAndView.addObject("appealList",appeals);
        if(resultCode!=0){
            modelAndView.setViewName("main");
        }else {
            modelAndView.setViewName("main");
        }
        return modelAndView;
    }

    @RequestMapping("/shownotice")
    public ModelAndView showContent(int id){
        ModelAndView modelAndView = new ModelAndView();
        flag = "showcontent";
        Notice content = userService.getNoticeContent(id);
        modelAndView.addObject("notice",content);
        modelAndView.addObject("flag",flag);
        modelAndView.addObject("noticelist",notice);
        modelAndView.addObject("appealList",appeals);
        modelAndView.addObject("appealList2",appeals2);
        modelAndView.addObject("resignlist",resigns);
        modelAndView.addObject("resignlist2",resigns2);
        modelAndView.addObject("deskChangelist2",deskChange3);
        modelAndView.addObject("deskChangelist",deskChange2);
        modelAndView.addObject("staffwork",staffWork);
        modelAndView.setViewName("main");
        return modelAndView;
    }

    @RequestMapping("/passwordchange")
    public ModelAndView changePassword(@RequestParam("passwordNow") String passwordOld, @RequestParam("passwordNew")String passwordNew){
        ModelAndView modelAndView = new ModelAndView();
        int resultCode = 0 ;
        resultCode = userService.updateStaffWorkPassword(staffWork.getWorkId(),passwordNew);
        modelAndView.addObject("flag",flag);
        modelAndView.addObject("noticelist",notice);
        modelAndView.addObject("appealList",appeals);
        modelAndView.addObject("appealList2",appeals2);
        modelAndView.addObject("resignlist",resigns);
        modelAndView.addObject("resignlist2",resigns2);
        modelAndView.addObject("deskChangelist2",deskChange3);
        modelAndView.addObject("deskChangelist",deskChange2);
        modelAndView.addObject("staffwork",staffWork);
        if(resultCode!=0){
            modelAndView.setViewName("main");
        }else {
            modelAndView.setViewName("main");
        }
        return modelAndView;
    }
    @RequestMapping("/showfiles")
    public ModelAndView shoeFiles(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("redirect:http://localhost:8888");
        return modelAndView;
    }
}
