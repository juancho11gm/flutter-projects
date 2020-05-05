package com.demo.services;

import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import com.demo.model.User;
import com.demo.model.Worker;
import com.demo.repositories.WorkerRepository;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;



@RestController
public class UserController {

  @Autowired
  private WorkerRepository workerRepository;


	@GetMapping("/worker")
    public List<Worker> getAllWorkers() {
      return workerRepository.findAll();
    }

    @GetMapping("/worker/{id}")
    public ResponseEntity getWorkerById(@PathVariable(value = "id") String workerId){
        Optional<Worker> worker = workerRepository.findById(workerId);
        if(worker.isPresent()){
            return ResponseEntity.ok().body(worker);
        }
        return (ResponseEntity) ResponseEntity.notFound();
    }

    @PostMapping("/worker")
    public User addWorker(@RequestBody Worker worker) {
        System.out.println("HOLAAAAA");
        System.out.println(worker);
        return workerRepository.save(worker);
    }

    @PutMapping("/worker/{id}")
    public ResponseEntity updateWorker(@PathVariable(value = "id") String workerId, @Valid @RequestBody Worker workerDetails) {
        Optional<Worker> worker = workerRepository.findById(workerId);
        if(worker.isPresent()){
            worker.get().setEmail(workerDetails.getEmail());
            worker.get().setPassword(workerDetails.getPassword());
            final Worker updatedWorker = workerRepository.save(worker.get());
            return ResponseEntity.ok(true);
        }else{
            return ResponseEntity.ok(false);
        }
    }

    @DeleteMapping("/worker/{id}")
    public ResponseEntity deleteWorker(@PathVariable(value = "id") String workerId) {
        Optional<Worker> worker = workerRepository.findById(workerId);
        if(worker.isPresent()){
            workerRepository.delete(worker.get());
            return ResponseEntity.ok(true);
        }
        return (ResponseEntity) ResponseEntity.badRequest();
    }
    
    
}