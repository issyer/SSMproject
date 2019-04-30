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
    private List<DeskChange> deskChange;
    private List<DeskChange> deskChange2;
    private List<Resign> resigns;
    private List<Resign> resigns2;
    private List<Appeal> appeals;
    private List<Appeal> appeals2;
    private List<Notice> notice;

    private String flag = "showtitle";
    private StaffPersonal staffPersonal = new StaffPersonal();

    private ModelAndView modelAndView;

    @RequestMapping("/login")
    public ModelAndView login(@RequestParam("email") String email,@RequestParam("password") String password){
        modelAndView = new ModelAndView();
        if(loginCheck.loginForRegist(email,password)){
            staffPersonal.setIdcardNum(email);
            modelAndView.setViewName("register");
        }else if(loginCheck.loginForMain(email,password)){
            flag = "showtitle";
            modelAndView.setViewName("main");
            staffWork = userService.getUser(email);
            deskChange = userService.getDeskChangeList(staffWork.getWorkId());
            deskChange2 = userService.getDeskChangeList2(staffWork.getWorkId());
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
            modelAndView.addObject("deskChangelist2",deskChange2);
            modelAndView.addObject("deskChangelist",deskChange);
            modelAndView.addObject("staffwork",staffWork);
        }
        return modelAndView;
    }
    @RequestMapping("/regist")
    public ModelAndView regist(@Valid StaffPersonal staffPersonal2){
        staffPersonal2.setIdcardNum(staffPersonal.getIdcardNum());
        ModelAndView modelAndView = new ModelAndView();
        int resultCode = userService.registUser(staffPersonal2);
        if(resultCode!=0){
            modelAndView.setViewName("main");
        }else {
            modelAndView.setViewName("register");
        }
        return modelAndView;
    }

    @RequestMapping("/deskchange")
    public ModelAndView changeWorkDesk(@Valid DeskChange deskChange1){
        deskChange1.setWorkId(staffWork.getWorkId());
        int resultCode = userService.deskChangeApply(deskChange1);
        deskChange = userService.getDeskChangeList(staffWork.getWorkId());
        modelAndView.addObject("deskChangelist",deskChange);
        if(resultCode!=0){
            modelAndView.setViewName("main");
        }else {
            modelAndView.setViewName("main");
        }
        return modelAndView;
    }


    @RequestMapping("/resign")
    public ModelAndView resign(@Valid Resign resig){
        resig.setWorkId(staffWork.getWorkId());
        resig.setName(staffWork.getName());
        int resultCode = userService.resignApply(resig);
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
        appeal.setWorkId(staffWork.getWorkId());
        appeal.setName(staffWork.getName());
        int resultCode = userService.attendanceAppeal(appeal);
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
        flag = "showcontent";
        Notice content = userService.getNoticeContent(id);
        modelAndView.addObject("notice",content);
        modelAndView.addObject("flag",flag);
        modelAndView.setViewName("main");
        return modelAndView;
    }

    @RequestMapping("/passwordchange")
    public ModelAndView changePassword(@RequestParam("passwordNow") String passwordOld, @RequestParam("passwordNew")String passwordNew){
        modelAndView = new ModelAndView();
        int resultCode = userService.updateStaffWorkPassword(staffWork.getWorkId(),passwordNew);
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
