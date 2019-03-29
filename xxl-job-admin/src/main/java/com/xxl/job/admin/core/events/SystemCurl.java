package com.xxl.job.admin.core.events;

import java.net.InetAddress;
import java.net.NetworkInterface;
import java.util.Enumeration;

import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

@Component
public class SystemCurl implements ApplicationListener<ContextRefreshedEvent> {

    public InetAddress getLocalHostLANAddress() throws Exception {
        try {
            InetAddress candidateAddress = null;
            // 遍历所有的网络接口
            for (Enumeration ifaces = NetworkInterface.getNetworkInterfaces(); ifaces.hasMoreElements(); ) {
                NetworkInterface iface = (NetworkInterface) ifaces.nextElement();
                // 在所有的接口下再遍历IP
                for (Enumeration inetAddrs = iface.getInetAddresses(); inetAddrs.hasMoreElements(); ) {
                    InetAddress inetAddr = (InetAddress) inetAddrs.nextElement();
                    if (!inetAddr.isLoopbackAddress()) {// 排除loopback类型地址
                        if (inetAddr.isSiteLocalAddress()) {
                            // 如果是site-local地址，就是它了
                            return inetAddr;
                        } else if (candidateAddress == null) {
                            // site-local类型的地址未被发现，先记录候选地址
                            candidateAddress = inetAddr;
                        }
                    }
                }
            }
            if (candidateAddress != null) {
                return candidateAddress;
            }
            // 如果没有发现 non-loopback地址.只能用最次选的方案
            InetAddress jdkSuppliedAddress = InetAddress.getLocalHost();
            return jdkSuppliedAddress;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void onApplicationEvent(ContextRefreshedEvent contextRefreshedEvent) {
        String consul_host = System.getenv("consul_host");
        String consul_port = System.getenv("consul_port");
        String service_ip = System.getenv("service_ip");
        String service_name = System.getenv("service_name");
        String service_port = System.getenv("service_port");
        String service_id = System.getenv("service_id");
        String acl_token = System.getenv("acl_token");

//    	String consul_host = "192.168.2.171";
//        String consul_port = "8500";
//        String service_ip = "10.10.100.92";
//        String service_name = "paas-basic-task";
//        String service_port = "9024";
//        String service_id = "0123456789";
//        String acl_token = "787bd467-a93e-8558-1aaf-f7c4036c406b";
        
        System.out.println("==========================");
        System.out.println("从环境变量中读取的数据");
        System.out.println("consul_host " + consul_host);
        System.out.println("consul_port " + consul_port);
        System.out.println("service_ip " + service_ip);
        System.out.println("service_name " + service_name);
        System.out.println("service_port " + service_port);
        System.out.println("service_id " + service_id);
        System.out.println("acl_token " + acl_token);
        System.out.println("==========================");

//        consul_host = "192.168.0.212";
//        service_name = "paas-basic-task";
        if (consul_host != null) {
            System.out.println("自动注册consul");
            String hostAddress = "";
            try {
                InetAddress localHostLANAddress = getLocalHostLANAddress();
                hostAddress = localHostLANAddress.getHostAddress();
            } catch (Exception e) {
                e.printStackTrace();
            }
            hostAddress = service_ip == null ? hostAddress : service_ip;
            service_port = service_port == null ? "9024" : service_port;
            service_name = service_name == null ? "paas-basic-task" : service_name;
            acl_token = acl_token == null ? "787bd467-a93e-8558-1aaf-f7c4036c406b" : acl_token;

            System.out.println("==========================");
            System.out.println("实际请求变量中读取的数据");
            System.out.println("consul_host " + consul_host);
            System.out.println("consul_port " + consul_port);
            System.out.println("service_ip " + service_ip);
            System.out.println("hostAddress " + hostAddress);
            System.out.println("service_name " + service_name);
            System.out.println("service_port " + service_port);
            System.out.println("service_id " + service_id);
            System.out.println("acl_token " + acl_token);
            System.out.println("==========================");

//            String b = "{" +
//                    "\"ID\":\"4034a748-2192-161a-0510-9bf59fe950b2\"," +
//                    "\"Node\":\""+service_name+"\"," +
//                    "\"Address\":\"" + consul_host + "\"," +
//                    "\"NodeMeta\":{" +
//                    "\"external-node\":\"true\"," +
//                    "\"external-probe\":\"true\"" +
//                    "}," +
//                    "\"Service\":{" +
//                    "\"ID\":\"" + service_name+service_id + "\", " +
//                    "\"Service\":\"" + service_name + "\", " +
//                    "\"Address\":\"" + hostAddress + "\"," +
//                    "\"Port\": " + service_port +
//                    "}," +
//                    "\"Check\": {" +
//                    "    \"Node\": \""+service_name+"\"," +
//                    "    \"CheckID\": \"service:" + service_name + "\"," +
//                    "    \"Name\": \"" + service_name + " health check\"," +
//                    "    \"Notes\": \"Script based health check\"," +
//                    "    \"Status\": \"passing\"," +
//                    "    \"ServiceID\": \"" + service_name+service_id + "\"," +
////                    "	 \"ServiceTags\": [" +
////                    "                \"urlprefix-/paas-basic-task\","+
////                    "                \"secure=false\""+
////                    "            ],"+
//                    "    \"Definition\": {" +
//                    "      \"HTTP\": \"" + hostAddress + ":" + service_port + "/paas-basic-task\", " +
//                    "      \"Interval\": \"5s\"," +
//                    "      \"Timeout\": \"1s\"," +
//                    "      \"DeregisterCriticalServiceAfter\": \"30s\"" +
//                    "    }" +
//                    "  }," +
//                    "  \"SkipNodeUpdate\": false" +
//                    "}";
            String b = "{"+
					    "\"ID\":\"4034a748-2192-161a-0510-9bf59fe950b2\","+
					    "\"Name\":\""+service_name+"\","+
//					    "\"Datacente\":\"boclouddatacentor\","+
					    "\"Tags\":["+
					    "    \"urlprefix-/paas-basic-task\","+
					    "    \"secure=false\""+
					    "],"+
					    "\"Address\":\"" + hostAddress + "\","+
					    "\"Port\":" + service_port+","+
					    "\"EnableTagOverride\":true,"+
					    "\"Check\":{"+
					    "    \"name\":\"tcp Health test\","+
					    "    \"DeregisterCriticalServiceAfter\":\"90m\","+
					    "    \"Interval\":\"10s\","+
					    "    \"timeout\":\"1s\","+
					    "    \"tcp\":\"" + hostAddress + ":" + service_port + "\""+
					    "}"+
					"}";
            CloseableHttpClient httpClient = HttpClientBuilder.create().build();
            HttpPut putRequest = new HttpPut("http://" + consul_host + ":"+consul_port+"/v1/agent/service/register");
            putRequest.addHeader("Content-Type", "application/json;charset=UTF-8");
            putRequest.addHeader("X-Consul-Token", acl_token);
            StringEntity input = null;
            try {
                input = new StringEntity(b);
                input.setContentEncoding("UTF-8");
                input.setContentType("application/json");

                putRequest.setEntity(input);
                HttpResponse response = httpClient.execute(putRequest);
                System.out.println("==========================paas-basic-task registry result:==========================");
                System.out.println(EntityUtils.toString(response.getEntity()));
                System.out.println("==========================paas-basic-task registry end:=============================");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
