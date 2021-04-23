package com.gump.javabase;

import java.net.*;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

/**
 * @Description: TODO
 * @Author gumpLiu
 * @Date 2021-03-01
 * @Version V1.0
 **/
public class IPTestMain {

    public static String getIP() {
        Enumeration<?> netInterfaces;
        List<NetworkInterface> netlist=new ArrayList<NetworkInterface>();
        try {
            netInterfaces = NetworkInterface.getNetworkInterfaces();//获取当前环境下的所有网卡
            while (netInterfaces.hasMoreElements()) {
                NetworkInterface ni=(NetworkInterface)netInterfaces.nextElement();
                if(ni.isLoopback())
                    continue;//过滤 lo网卡
                netlist.add(0,ni);//倒置网卡顺序
            }  /*
                  用上述方法获取所有网卡时，得到的顺序与服务器中用ifconfig命令看到的网卡顺序相反，
                  因此，想要从第一块网卡开始遍历时，需要将Enumeration<?>中的元素倒序 */

            for(NetworkInterface list:netlist) { //遍历每个网卡

                Enumeration<?> cardipaddress = list.getInetAddresses();//获取网卡下所有ip

                while(cardipaddress.hasMoreElements()){//将网卡下所有ip地址取出
                    InetAddress ip = (InetAddress) cardipaddress.nextElement();
                    if(!ip.isLoopbackAddress()){
                        if(ip.getHostAddress().equalsIgnoreCase("127.0.0.1")){//guo
                            //return ip.getHostAddress();
                            continue;
                        }
                        if(ip instanceof Inet6Address)  {   //过滤ipv6地址  add by liming 2013-9-3
                            //return ip.getHostAddress();
                            continue;
                        }
                        if(ip instanceof Inet4Address)  {    //返回ipv4地址
                            return ip.getHostAddress();
                        }
                    }
                    return ip.getLocalHost().getHostAddress();//默认返回
                }

            }


        } catch (SocketException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }

    public static InetAddress getLocalHostExactAddress() {
        try {
            InetAddress candidateAddress = null;

            Enumeration<NetworkInterface> networkInterfaces = NetworkInterface.getNetworkInterfaces();
            while (networkInterfaces.hasMoreElements()) {
                NetworkInterface iface = networkInterfaces.nextElement();
                // 该网卡接口下的ip会有多个，也需要一个个的遍历，找到自己所需要的
                for (Enumeration<InetAddress> inetAddrs = iface.getInetAddresses(); inetAddrs.hasMoreElements(); ) {
                    InetAddress inetAddr = inetAddrs.nextElement();
                    // 排除loopback回环类型地址（不管是IPv4还是IPv6 只要是回环地址都会返回true）
                    if (!inetAddr.isLoopbackAddress()) {
                        if (inetAddr.isSiteLocalAddress()) {
                            // 如果是site-local地址，就是它了 就是我们要找的
                            // ~~~~~~~~~~~~~绝大部分情况下都会在此处返回你的ip地址值~~~~~~~~~~~~~
                            return inetAddr;
                        }

                        // 若不是site-local地址 那就记录下该地址当作候选
                        if (candidateAddress == null) {
                            candidateAddress = inetAddr;
                        }

                    }
                }
            }

            // 如果出去loopback回环地之外无其它地址了，那就回退到原始方案吧
            return candidateAddress == null ? InetAddress.getLocalHost() : candidateAddress;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        System.out.println(getIP());

        System.out.println(getLocalHostExactAddress());
    }
}
