package in.devops.demo.controller.status;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/*
 *  Owner: Gaurav Sharma
 */
@RestController
@RequestMapping("/status")
public class StatusController {

	@GetMapping("/ok")
	public String status() {
		return "application running successfully";
	}
	
}
