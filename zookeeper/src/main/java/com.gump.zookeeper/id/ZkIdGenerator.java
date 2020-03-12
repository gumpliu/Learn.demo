package com.gump.zookeeper.id;

import org.apache.zookeeper.CreateMode;
import org.apache.zookeeper.KeeperException;
import org.apache.zookeeper.ZooDefs;
import org.apache.zookeeper.ZooKeeper;
import org.apache.zookeeper.data.Stat;

import java.io.IOException;
import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * 使用zk生成分布式唯一id，自增有序
 *
 * @author CC11001100
 */
public class ZkIdGenerator {
 
    public ZooKeeper zk;
    public String path;


    public ZkIdGenerator(String serverAddress, String path) {
        try {
            this.path = path;
            zk = new ZooKeeper(serverAddress, 3000, event -> {
                System.out.println(event.toString());
            });
 
            if (zk.exists(path, false) == null) {
                path = zk.create(path, new byte[0], ZooDefs.Ids.OPEN_ACL_UNSAFE, CreateMode.PERSISTENT);
            }
        } catch (IOException | InterruptedException | KeeperException e) {
            e.printStackTrace();
        }
    }
 
    public long next() {
        try {
            Stat stat = zk.setData(path, new byte[0], -1);
            return stat.getVersion();
        } catch (KeeperException | InterruptedException e) {
            e.printStackTrace();
        }
        return -1;
    }

public static void main(String[] args) {


//        for (int i = 0; i < 1000; i++) {
//            DistributedIdGeneraterService distributedIdGeneraterService = new DistributedIdGeneraterService();
//            String s = distributedIdGeneraterService.generateId();
//            System.out.println(s);
//        }


        ZkIdGenerator zkIdGenerator = new ZkIdGenerator("localhost:2181", "/id-gen");//3040
        ZkIdGenerator zkIdGenerator1 = new ZkIdGenerator("localhost:2181", "/id-gen/id");
        ZkIdGenerator zkIdGenerator2 = new ZkIdGenerator("localhost:2181", "/id-gen/id1");

//    private final
    ExecutorService executorService =  Executors.newFixedThreadPool(100);

    System.out.println(Integer.MAX_VALUE);

//    for (int i = 0; i < 11; i++) {
//        System.out.println(zkIdGenerator.next());

        System.out.println(zkIdGenerator1.next());

//        System.out.println(zkIdGenerator2.next());

//    }
//    try {
//        Thread.sleep(100000);
//    } catch (InterruptedException e) {
//        e.printStackTrace();
//    }

}
 
}